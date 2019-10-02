#Import necessary functions from Jinja2 module
from jinja2 import Environment, FileSystemLoader

#Import YAML module
import yaml

#Load data from YAML into Python dictionary
config_data = yaml.load(open('./rules.yml'))

#Load Jinja2 template
env = Environment(loader = FileSystemLoader('./'), trim_blocks=True, lstrip_blocks=True)
template = env.get_template('karabiner_template.json')

#Render the template with data and print the output
print(template.render(config_data))
