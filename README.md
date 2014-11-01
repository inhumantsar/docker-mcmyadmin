docker-mcmyadmin
================

Container to run McMyAdmin/Minecraft servers with.

## Defaults ##

 - Exposes ports 8080 and 25565.
 - Admin panel password: mootoothree
 - MB of memory available to Java: 2048

## Run ##

    docker run  -d \
                -e PASSWORD=mynewpass \
                -e JAVA_MEMORY=1024 \
                inhumantsar/mcmyadmin

## Advanced Setup ##

AUFS will add a a measurable amount of latency to disk operations so
you may want to use a host volume for the /home/mcmyadmin directory. Be aware
that if you do this, you will need to download McMyAdmin into the host
volume yourself. In this case your first run will be different as well.

    # Configure McMyAdmin
    docker run  -it \
                -v /host/path/to/mcmyadmin:/home/mcmyadmin
                inhumantsar/mcmyadmin
                -nonotice -updateonly

    # Once the update finishes, stop the container with Ctrl+C
    # Run McMyAdmin as a daemon w/ options
    docker run  -d \
                -v /host/path/to/mcmyadmin:/home/mcmyadmin
                -e PASSWORD=mynewpass \
                -e JAVA_MEMORY=1024 \
                inhumantsar/mcmyadmin
    
