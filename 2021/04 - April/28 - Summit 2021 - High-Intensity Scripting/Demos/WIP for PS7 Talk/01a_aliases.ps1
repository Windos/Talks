$Services = Service |
    ? Status -eq Running |
    select -F 5