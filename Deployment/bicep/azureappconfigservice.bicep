param appConfigName string
param skuName string = 'Standard'
param keyvalueNames array
param keyvalueValues array

resource appConfig 'Microsoft.AppConfiguration/configurationStores@2024-05-01' = {
  name: appConfigName
  location: resourceGroup().location
  sku: {
    name: skuName
  }
}

resource appConfigKeyValue 'Microsoft.AppConfiguration/configurationStores/keyValues@2024-05-01' = [
  for (item, i) in keyvalueNames: {
    parent: appConfig
    name: item
    properties: {
      value: keyvalueValues[i]
    }
  }
]

output appConfigId string = appConfig.id
output appConfigEndpoint string = appConfig.properties.endpoint
