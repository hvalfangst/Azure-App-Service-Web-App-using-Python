param webAppName string = 'hvalfangstlinuxwebapp'
param sku string = 'F1'
param linuxFxVersion string = 'PYTHON|3.11'
param location string = 'West Europe'
var appServicePlanName = 'hvalfangstserviceplan'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: sku
  }
  kind: 'linux'
  properties: {
      reserved: true
  }
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}