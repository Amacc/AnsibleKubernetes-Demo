<#
    .Synopsis
        Helper script to run this project in the awx execution environment container
#>
param(
    # Image to run
    $Image = "quay.io/ansible/awx-ee:latest",
    
    # The name of the container that is built
    $ContainerName = "ansible",
    
    # Exec into a currently running container
    [switch] $exec,
    [switch] $start
)
if($start){ docker start $ContainerName }
if($exec -or $start){ 
    docker exec -it $ContainerName /bin/bash
    return 
}
docker run -it `
    -v "${PWD}:/runner/" `
    -v "//var/run/docker.sock://var/run/docker.sock" `
    -v "${Env:USERPROFILE}/.ssh:/runner/.ssh:ro" `
    -v "${Env:USERPROFILE}/.kube:/home/runner/.kube:ro" `
    -u root `
    --name $ContainerName `
    --entrypoint /bin/bash `
    $Image
