import jenkins.model.Jenkins
import hudson.model.PageDecorator

// Disable Script Console by removing it from the UI
def instance = Jenkins.getInstance()

// Remove Script Console link from Manage Jenkins
instance.getActions().removeAll { action ->
    action.getUrlName() == "script"
}

// Additional security measure - restrict script execution
System.setProperty("jenkins.model.Jenkins.slaveAgentPort", "-1")
System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "default-src 'none'; script-src 'self';")

println "Script Console access restricted"