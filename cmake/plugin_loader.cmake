git_clone(https://github.com/vaughan0/go-ini a98ad7ee00ec53921f08832bc06ecf7fd600e6a1)
git_clone(https://github.com/aws/aws-sdk-go 90a21481e4509c85ee68b908c72fe4b024311447)
add_dependencies(aws-sdk-go go-ini)
add_external_plugin(git https://github.com/MattLTW/heka-plugins.git master)
