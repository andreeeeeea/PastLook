async function postInfo() {
    const response = await fetch("https://pastlook.site/api/v1/event", {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: `{
            "event_name": "test",
            "year": "2022-01-01",
            "country_name": "Romania",
            "event_content": "dadada",
            "country_id": 12
          }`,
        });
        
        response.json().then(data => {
          console.log(data);
        });
}

