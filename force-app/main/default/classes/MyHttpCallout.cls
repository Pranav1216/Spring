public class MyHttpCallout {
    public void makeHttpCallout(){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
        
    }
}

// To invoke this 
//MyHttpCallout httpCallout = new MyHttpCallout();
//httpCallout.makeHttpCallout();
