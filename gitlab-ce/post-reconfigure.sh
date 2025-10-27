#!/bin/sh
echo "[Post-Reconfigure] Starting post-reconfigure script..."
sleep 10
echo "[Post-Reconfigure] Disabling GitLab signup..."
gitlab-rails runner "::Gitlab::CurrentSettings.update!(signup_enabled: false)"

echo "[Post-Reconfigure] Creating low-privileged developer user..."
gitlab-rails runner "
  existing_user = User.find_by(username: 'developer')
  if existing_user
    puts 'Developer user already exists'
  else
    # Get admin user and organization for proper user creation
    admin_user = User.find_by(username: 'root')
    org = Organizations::Organization.first

    # Create user with strong temporary password to pass validation
    result = Users::CreateService.new(
      admin_user,
      username: 'developer',
      email: 'developer@zeroday.cloud',
      name: 'Developer User',
      password: 'Temp!Str0ng#Pass2025',
      password_confirmation: 'Temp!Str0ng#Pass2025',
      organization_id: org.id,
      skip_confirmation: true
    ).execute

    if result[:status] == :success
      user = result[:user]

      # Update password to match other targets (zerodaycloud1!)
      user.password = 'zerodaycloud1!'
      user.password_confirmation = 'zerodaycloud1!'
      user.save(validate: false)

      puts 'Developer user created successfully'
    else
      puts \"Failed to create developer user: #{result[:message]}\"
    end
  end
"

echo "[Post-Reconfigure] Post-reconfigure script completed"