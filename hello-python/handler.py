def handle(req):
    """handle a request to the function
    Args:
        req (str): request body
    """
    return f"Hello from OpenFaaS! You sent: {req}"