## Hey for AWS Lambda

This is a Lambda layer which contains a static version of Hey tool compatible with Linux 64 bit. **hey** is a tiny program that sends some load to a web application or to a http(s) endpoint. 
Please visit this awesome page [Hey](https://github.com/rakyll/hey) to know more about hey.

## Usage:

Clone the repository, then build the hey tool, which basically downloads the latest binary in a specific path. Then deploy using the [Serverles Framework](https://github.com/serverless/serverless)
```
git clone git@github.com:akaanirban/hey-aws-lambda-layer.git
cd hey-aws-lambda-layer
./build
sls deploy
```

This will create a layer in AWS Lambda. By default, when you create a lambda function and attach this layer, the `hey` executable will be available in `/opt/bin/hey` in the lambda environment. Therefore you can directly call the `hey` binary from your code.

## Example usage in a Python application:
```python
import subprocess
   
def handler(event, context):
    cmd = "hey -n 100 -c 1 {}".format("http://<expernalip:port>")
    results = subprocess.run(cmd, check=True, stdout=subprocess.PIPE, shell=True).stdout
    print(results)
    return results
```

## NOTE: Since this is a wrapper on `hey`, I added the same licensing term as the original `hey` repository.