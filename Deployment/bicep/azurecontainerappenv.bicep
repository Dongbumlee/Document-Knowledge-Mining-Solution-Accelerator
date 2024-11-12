param environmentName string

// resource workspace 'Microsoft.OperationalInsights/workspaces@2021-12-01-preview' = {
//   name: 'workspace-$(uniqueString(resourceGroup().id))'
//   location: resourceGroup().location

//   properties: {
//     sku: {
//       name: 'PerGB2018'
//     }
//     retentionInDays: 30
//     workspaceCapping: {}
//   }
// }

resource environment 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: environmentName
  location: resourceGroup().location
  properties: {}
}
