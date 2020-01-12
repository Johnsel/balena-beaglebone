deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

BBB_FLASH = 'Power up the <%= TYPE_NAME %> while holding down the small button near the SD slot.
You need to keep it pressed until the blue LEDs start flashing wildly.'

postProvisioningInstructions = [
	instructions.BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	instructions.BOARD_REPOWER
]

module.exports =
	version: 1
	slug: 'ti-am335x-evm'
	aliases: [ 'am335x-evm' ]
	name: 'TI AM335X-EVM SK'
	arch: 'armv7hf'
	state: 'experimental'
	
	instructions: commonImg.instructions

	gettingStartedLink:
		windows: 'https://docs.resin.io/pocketbeagle/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/pocketbeagle/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/pocketbeagle/nodejs/getting-started/#adding-your-first-device'

	supportsBlink: false

	yocto:
		machine: 'ti-am335x-evm'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-thud'
		deployArtifact: 'resin-image-ti-am335x-evm.resinos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
