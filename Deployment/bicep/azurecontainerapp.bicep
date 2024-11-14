param containerappName string = 'containerapp'
param environmentName string = 'containerappenv'
param isIngress bool = false
param targetPort int = 80

resource containerappEnv 'Microsoft.App/managedEnvironments@2024-03-01' existing = {
  name: environmentName
  scope: resourceGroup()
}

resource containerapp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerappName
  location: resourceGroup().location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    managedEnvironmentId: containerappEnv.id
    configuration: {
      ingress: {
        external: isIngress
        targetPort: targetPort
      }
    }
  }
}

output managedIdentityPrincipalId string = containerapp.identity.principalId
