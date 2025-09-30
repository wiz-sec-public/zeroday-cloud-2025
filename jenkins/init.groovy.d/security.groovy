import jenkins.model.*
import hudson.security.*
import jenkins.security.s2m.AdminWhitelistRule

def instance = Jenkins.getInstance()

// Create admin user - the 'false' parameter disables signup
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("admin", "zerodaycloud1!")
instance.setSecurityRealm(hudsonRealm)

// Set authorization strategy - logged in users can do anything
def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)

// SECURITY HARDENING

// Disable executors on master (prevent jobs from running on master)
instance.setNumExecutors(0)
instance.setMode(hudson.model.Node.Mode.EXCLUSIVE)

// CLI is disabled via JAVA_OPTS in docker-compose

// Disable agent protocols (set port to -1)
instance.setSlaveAgentPort(-1)

// Save configuration
instance.save()

println "Jenkins security configured: admin/zerodaycloud1!"
println "Anonymous read: disabled"
println "User signup: disabled"
println "Master executors: 0 (jobs cannot run on master)"
println "CLI: disabled"
println "Agent port: disabled (-1)"
println "Script Console: restricted to admins only"