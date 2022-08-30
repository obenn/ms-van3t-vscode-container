docker run -d --name temp ms-van3t:latest 
docker cp temp:/workspace/ms-van3t/ns-3.33/src .
docker stop temp
docker rm temp
echo "src directory should now be available"