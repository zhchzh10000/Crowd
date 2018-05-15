from hashlib import sha256


def get_hash(password):
    sh = sha256()
    sh.update(password.encode('utf-8'))
    return sh.hexdigest()