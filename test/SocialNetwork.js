const { assert } = require('chai')

const SocialNetwork = artifacts.require('./SocialNetwork.sol')
require('chai')
    .use(require('chai-as-promised'))
    .should()

contract('SocialNetwork', ([deployer, author, tipper]) => {
    let socialNetwork

    before(async () =>{
        socialNetwork = await SocialNetwork.deployed()
    })

    describe('deployment', async () => {
        it('deploys succesfully', async () => {
            const address = await socialNetwork.address
            assert.notEqual(address, 0x0)
            assert.notEqual(address, '')
            assert.notEqual(address, null)
            assert.notEqual(address, undefined)
        })

        it('has a name', async () => {
            const name = await socialNetwork.name()
            assert.equal(name, 'Ethereum Social Network')
        })
    })
    describe('posts', async () => {
        let result, postCount
        it('create posts', async() => {
            result = await socialNetwork.createPost('First Post in Ethereum Social Network', {from: author })
            postCount = await socialNetwork.postCount()
            // success 
            assert.equal=(postCount, 1)
        })

        // it('lists posts', async() => {

        // })
        // it('allow users to tip posts', async() => {

        // })
    })
})