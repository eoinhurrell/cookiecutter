from setuptools import setup
from pip.req import parse_requirements
from pip.download import PipSession

README = open('README.md').read()


def get_requirements():
    return [str(x.req) for x
            in parse_requirements('requirements/production.txt',
                                  session=PipSession())]

setup(name='MODULE',
      version='0.1.0',
      description='MODULE DESCRIPTION',
      long_description=README,
      author='Eoin Hurrell',
      author_email='FIXME',
      package_dir={'MODULE': 'MODULE'},
      packages=['MODULE'],
      zip_safe=False,
      include_package_data=True,
      install_requires=get_requirements(),
      classifiers=[
      ],
      license='BSD'.
      keywords='',
      tests_require=['tox'],
      cmdclass={'test': Tox}
      )
      
      
