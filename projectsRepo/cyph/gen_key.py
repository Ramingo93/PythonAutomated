from cryptography.fernet import Fernet

with open('K.key', 'wb') as f:
    f.write(Fernet.generate_key())
    
