function fn() {    
  var config =

      {
         //Orchestrator API details
          apiBaseURL : 'https://samples.openweathermap.org',
          apiPathURL : '/data/2.5/history/city',
          city : 'London,UK',
          applicationid : 'appid'
      }

    return config;
}