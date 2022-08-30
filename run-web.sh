docker run -d -p 8080:8080 csi5901:latest ./waf --run "v2i-areaSpeedAdvisor-80211p --sumo-gui=false --vehicle-visualizer=true"
echo opening browser soon
sleep 5
open http://localhost:8080
