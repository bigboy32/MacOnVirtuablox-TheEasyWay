import cpuinfo

def is_amd():
    brand = cpuinfo.get_cpu_info()['brand']
    if "amd" in brand.lower():
        return True
    else:
        return False