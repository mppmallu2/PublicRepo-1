public class irctc {
    Public static Http http=new Http();
    Public static HTTPResponse response;
    Public static HttpRequest request;
    public static integer qq;
    @future (callout=true)
    Public static void seatAvail(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://irctc1.p.rapidapi.com/api/v1/checkSeatAvailability?classType=2S&fromStationCode=SUR&quota=GN&toStationCode=PUNE&trainNo=12158&date=2024-05-01');
        request.setMethod('GET');
        request.setHeader('X-RapidAPI-Key', 'fb1eb20084mshcdf3114bbfd6c1dp14f492jsnc9c75efdbc13');
        //.addHeader('X-RapidAPI-Host', 'irctc1.p.rapidapi.com');
        qq=10;
        response = http.send(request);
        system.debug(response.getBody());
    }
    Public static void pnrCheck(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://irctc1.p.rapidapi.com/api/v3/getPNRStatus?pnrNumber=8217518489');
        request.setHeader('X-RapidAPI-Key', 'fb1eb20084mshcdf3114bbfd6c1dp14f492jsnc9c75efdbc13');
        //.addHeader('X-RapidAPI-Host', 'irctc1.p.rapidapi.com');
        qq=10;
        response = http.send(request);
        system.debug(response.getBody());
    }
    
    @future (callout=true) 
    Public static void trainSchedulee(string trainNumber,string stationFrom,string stationTo,string jdate,string classCode){
        string apikey='ff73ea48-ec94-4e7e-9145-f46a537f8369';
        
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://indianrailapi.com/api/v2/SeatAvailability/apikey/'+apikey+'/TrainNumber/'+trainNumber+'/From/'+stationFrom+'/To/'+stationTo+'/Date/'+jdate+'/Quota/GN/Class/'+classCode);
        //request.setHeader('X-RapidAPI-Key', 'fb1eb20084mshcdf3114bbfd6c1dp14f492jsnc9c75efdbc13');
        qq=10;
        response = http.send(request);
        map<string,object> resBody=(map<string,object>)JSON.deserializeUntyped(response.getBody());
     system.debug(resBody);
    }
    Public static void trainSchedule(string trainNumber,string stationFrom,string stationTo,string jdate,string classCode){
        string apikey='64d91cd641d6721f61264e1f63ab65ae6970523e00f31d9a0ae1c8fbb7da46f7';
        
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://indianrailapi.com/api/v2/SeatAvailability/apikey/'+apikey+'/TrainNumber/'+trainNumber+'/From/'+stationFrom+'/To/'+stationTo+'/Date/'+jdate+'/Quota/GN/Class/'+classCode);
        //request.setHeader('X-RapidAPI-Key', 'fb1eb20084mshcdf3114bbfd6c1dp14f492jsnc9c75efdbc13');
        qq=10;
        response = http.send(request);
        map<string,object> resBody=(map<string,object>)JSON.deserializeUntyped(response.getBody());
     system.debug(resBody);
    }

}