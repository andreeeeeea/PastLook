const copy = "© <a href='https://www.openstreetmap.org/copyright'>OpenStreetMap</a> contributors";
const url = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
const osm = L.tileLayer(url, { attribution: copy });
const map = L.map("map", { layers: [osm] });
map.
    locate()
    .on("locationfound", (e) => map.setView(e.latlng, 8))
    .on("locationerror", () => map.setView([0, 0], 5));

async function load_markers() {
    const markers_url = `/api/v1/markers/?in_bbox=${map.getBounds().toBBoxString()}`
    const response = await fetch(markers_url)
    const geojson = await response.json()
    return geojson
}

function showForm() {
    document.getElementById('formElement').style.display = 'block';
}

async function render_markers() {
    const markers = await load_markers();
    const events_url = `https://pastlook.site/api/v1/event/`
    const responseMarkersArray = await fetch(`https://pastlook.site/api/v1/markers/`)
    const response = await fetch(events_url)
    const eventArray = await response.json()
    const markersArray = await responseMarkersArray.json()
    markersArray.features.sort(function (a, b) {
        return a.properties.country_id - b.properties.country_id
    })
   // console.log(markersArray.features[0])
    /*for (const marker of markersArray.features){
        for(let i = 0; i < eventArray.length; i++) {
            if (eventArray[i].country_id == marker.properties.country_id) {
                console.log(eventArray[i].country_name + "  " + marker.properties.country_name);
            }
        }
    }*/
    L.geoJSON(markers)
    .bindPopup((layer) => `<h1>
    <input type="range" min="100" max="2022" value=${layer.feature.properties.year.substr(0,4)} id = "slider">
    <div id = "SelectValue">
    </div>
    </h1>` 
  + `<h2><div id = "eventName">` 
    + layer.feature.properties.event_name
    +`</div></h2><p><b>Country Name: ` 
    + layer.feature.properties.country_name 
    + `</p><p><div id = "eventContent">Events: `
    + layer.feature.properties.event_content 
    + `</div></p><script>
    var slider = document.getElementById("slider");
    var eventName = document.getElementById("eventName");
    var eventContent = document.getElementById("eventContent");
    var SecretValue = document.getElementById("SelectValue");
    SecretValue.innerHTML = slider.value;
    slider.oninput = async function(){
    var sliderValue = this.value;
    SecretValue.innerHTML = sliderValue;
    const events_url = 'https://pastlook.site/api/v1/event/'
    const response = await fetch(events_url)
    const eventArray = await response.json()
    var ok = 0;
    for (const event of eventArray) {
        if (event.country_id == ${layer.feature.properties.country_id} && sliderValue == event.year.substr(0,4)) {
            eventName.innerHTML = event.event_name;
            eventContent.innerHTML = event.event_content;
            ok = 1;
        }
    }
    if (ok == 0) {
        eventName.innerHTML = "N/A";
        eventContent.innerHTML = "N/A"
    }
    }
    </script>`)
    .addTo(map);

}map.on('popupopen', function(){
    var cont = document.getElementsByClassName('leaflet-popup-content')[0];    
    var lst = cont.getElementsByTagName('script');
    for (var i=0; i<lst.length;i++) {
       eval(lst[i].innerText)
    }
});

map.on("moveend", render_markers);
