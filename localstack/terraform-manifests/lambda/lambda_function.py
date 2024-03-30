import json

def lambda_handler(event, context):
    if event['path'] == '/message':
        payload = json.loads(event['body'])
    elif event['path'] == '/gilush':
        payload = 'HelloGili'
    elif event['path'] == '/comovai':
        payload = 'como vai? Eu estou bem'
    else:
        payload = 'welcome'
    return {
        'statusCode': 200,
        'body': payload
    }
