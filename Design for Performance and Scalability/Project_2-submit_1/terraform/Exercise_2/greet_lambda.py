import os

def lambda_handler(event, context):
    print("{} from Lambda!".format(os.environ['greeting']))
    # NOTE: Adding above print extra since it shows in the logs only on printing, not if it's returned
    return "{} from Lambda!".format(os.environ['greeting'])