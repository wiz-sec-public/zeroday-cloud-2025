import jenkins.model.Jenkins

def jenkinsHome = Jenkins.getInstance().getRootDir()

// Remove secret.key.not-so-secret file if it exists
def insecureFile = new File(jenkinsHome, "secret.key.not-so-secret")
if (insecureFile.exists()) {
    insecureFile.delete()
    println "Removed insecure file: secret.key.not-so-secret"
} else {
    println "Insecure file already removed: secret.key.not-so-secret"
}

// Ensure proper permissions on secret.key
def secretKey = new File(jenkinsHome, "secret.key")
if (secretKey.exists()) {
    secretKey.setReadable(false, false)
    secretKey.setReadable(true, true)
    secretKey.setWritable(false, false)
    secretKey.setWritable(true, true)
    println "Secured permissions on secret.key"
}