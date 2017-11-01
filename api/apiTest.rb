require 'httparty'

class TestParty
  include HTTParty
  base_uri 'http://production.hummingbird-api.appspot.com'
 
end
RSpec.describe 'API TEST - POST' do
    context 'Create a new register android and enabled' do
        it 'Should create a new register and return status code 200' do
            begin
                response = TestParty.post('/featureflag?appVersion=2.3.1001&platform=ANDROID&enabled=TRUE&name=teste')
                expect(response.code).to eql(200)
                expect(response.headers['content-type']).to eql('application/json')
                response.body.is_a?(Hash)
                actual = JSON.parse(response.body)
                expect(actual['successMessage']).to eql('Your featureFlag was created with success')
            end
        end
    end
    context 'Create a new register ios and enabled' do
        it 'Should create a new register and return status code 200' do
            begin
                response = TestParty.post('/featureflag?appVersion=2.3.100&platform=iOS&enabled=TRUE&name=teste')
                expect(response.code).to eql(200)
                expect(response.headers['content-type']).to eql('application/json')
                response.body.is_a?(Hash)
                actual = JSON.parse(response.body)
                expect(actual['successMessage']).to eql('Your featureFlag was created with success')
            end
        end
    end
    context 'Create a new register android and not enabled' do
        it 'Should create a new register and return status code 200' do
            begin
                response = TestParty.post('/featureflag?appVersion=2.3.1001&platform=ANDROID&enabled=FALSE&name=teste')
                expect(response.code).to eql(200)
                expect(response.headers['content-type']).to eql('application/json')
                response.body.is_a?(Hash)
                actual = JSON.parse(response.body)
                expect(actual['successMessage']).to eql('Your featureFlag was created with success')
            end
        end
    end
    context 'Create a new register ios and not enabled' do
        it 'Should create a new register and return status code 200' do
            begin
                response = TestParty.post('/featureflag?appVersion=2.3.1001&platform=iOS&enabled=FALSE&name=teste')
                expect(response.code).to eql(200)
                expect(response.headers['content-type']).to eql('application/json')
                response.body.is_a?(Hash)
                actual = JSON.parse(response.body)
                expect(actual['successMessage']).to eql('Your featureFlag was created with success')
            end
        end
    end
    context 'Send a empty request'do
        it'Should return the status code 400'do
        begin
            response = TestParty.post('/featureflag?')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            end
        end
    end
    context 'Send a request with wrong format of appVersion'do
        it'Should not create the register, return a error message and a error code'do
        data = {
                'errorCode' => 103,
                'errorMessage' => 'Invalid appVersion'   
            }
        begin
            response = TestParty.post('/featureflag?appVersion=23100&platform=ANDROID&enabled=TRUE&name=teste')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            actual = JSON.parse(response.body)
            expect(actual).to eql(data)
            end
        end
    end
     context 'Send a request with wrong format of platform'do
        it'Should not create the register, return a error message and a error code'do
        data = {
                'errorCode' => 100,
                'errorMessage' => 'Invalid platform'   
            }
        begin
            response = TestParty.post('/featureflag?appVersion=2.3.100&platform=android&enabled=TRUE&name=teste')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            actual = JSON.parse(response.body)
            expect(actual).to eql(data)
            end
        end
    end
    context 'Send a request with invalid platform'do
        it'Should not create the register, return a error message and a error code'do
        data = {
                'errorCode' => 100,
                'errorMessage' => 'Invalid platform'   
            }
        begin
            response = TestParty.post('/featureflag?appVersion=2.3.100&platform=WINDOWS&enabled=TRUE&name=teste')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            actual = JSON.parse(response.body)
            expect(actual).to eql(data)
            end
        end
    end
    context 'Send a request with wrong format of paramenter enabled'do
        it'Should not create the register, return a error message and a error code'do
        data = {
                'errorCode' => 101,
                'errorMessage' => 'The enabled parameter is not a boolean'   
            }
        begin
            response = TestParty.post('/featureflag?appVersion=2.3.100&platform=ANDROID&enabled=true&name=teste')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            actual = JSON.parse(response.body)
            expect(actual).to eql(data)
            end
        end
    end
    context 'Send a request with a name less than 3 caracters'do
        it'Should not create the register, return a error message and a error code'do
        data = {
                'errorCode' => 102,
                'errorMessage' => 'Invalid name'   
            }
        begin
            response = TestParty.post('/featureflag?appVersion=2.3.100&platform=ANDROID&enabled=TRUE&name=te')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            actual = JSON.parse(response.body)
            expect(actual).to eql(data)
            end
        end
    end
    context 'Send a request with a name more than 20 caracters'do
        it'Should not create the register, return a error message and a error code'do
        data = {
                'errorCode' => 102,
                'errorMessage' => 'Invalid name'   
            }
        begin
            response = TestParty.post('/featureflag?appVersion=2.3.100&platform=ANDROID&enabled=TRUE&name=LoremipsumdolortesteDoTeste')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            actual = JSON.parse(response.body)
            expect(actual).to eql(data)
            end
        end
    end
    context 'Send a request without the paramenter name'do
        it'Should not create the register and return a error code'do
        begin
            response = TestParty.post('/featureflag?appVersion=2.3.100&platform=ANDROID&enabled=TRUE')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            actual = JSON.parse(response.body)
            expect(actual['errorCode']).to eql(102)
            end
        end
    end
    context 'Send a request without the paramenter enabled'do
        it'Should not create the register and return a error code'do
        begin
            response = TestParty.post('/featureflag?appVersion=2.3.100&platform=ANDROID&name=teste')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            actual = JSON.parse(response.body)
            expect(actual['errorCode']).to eql(101)
            end
        end
    end
    context 'Send a request without the paramenter platform'do
        it'Should not create the register and return a error code'do
        begin
            response = TestParty.post('/featureflag?appVersion=2.3.100&enabled=TRUEname=teste')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            actual = JSON.parse(response.body)
            expect(actual['errorCode']).to eql(100)
            end
        end
    end
    context 'Send a request without the paramenter platform'do
        it'Should not create the register and return a error code'do
        begin
            response = TestParty.post('/featureflag?&platform=ANDROID&enabled=TRUE&name=teste')
            expect(response.code).to eql(400)
            expect(response.headers['content-type']).to eql('application/json')
            response.body.is_a?(Hash)
            actual = JSON.parse(response.body)
            expect(actual['errorCode']).to eql(103)
            end
        end
    end
end
RSpec.describe 'API TEST - GET' do
    context 'Consulting a created register' do
        it 'Must return the last record with the last sent parameters' do
            begin
                response = TestParty.post('/featureflag?appVersion=2.3.1001&platform=ANDROID&enabled=TRUE&name=teste')
                expect(response.code).to eql(200)
            end
            begin
                responseGet = TestParty.get('/featureflag?appVersion=2.3.1001&platform=ANDROID')
                expect(responseGet.code).to eql(200)
            end
        end
    end
    context 'Consulting a created register' do
        it 'Must return the last record with the last sent parameters' do
            begin
                responseGet = TestParty.get('/featureflag?appVersion=2.3.1001&platform=ANDROID')
                expect(responseGet.headers['content-type']).to eql('application/json')
                responseGet.body.is_a?(Hash)
                expect(responseGet.code).to eql(200)
            end
        end
    end
    context 'Consulting a created register with wrong platform parameter' do
        it 'Should return a error message and status code 400' do
            begin
                responseGet = TestParty.get('/featureflag?appVersion=21.0.0&platform=ANDROID')
                expect(responseGet.code).to eql(400)
                expect(responseGet.headers['content-type']).to eql('application/json')
                responseGet.body.is_a?(Hash)
                actual = JSON.parse(responseGet.body)
                expect(actual['errorCode']).to eql(104)
                expect(actual['errorMessage']).to eql("You don't have any feature flag")
            end
        end
    end
    context 'Consulting a created register with a appVersion which not exist' do
        it 'Should return a error message and status code 400' do
            begin
                responseGet = TestParty.get('/featureflag?appVersion=21.0.0&platform=iOS')
                expect(responseGet.code).to eql(400)
                expect(responseGet.headers['content-type']).to eql('application/json')
                responseGet.body.is_a?(Hash)
                actual = JSON.parse(responseGet.body)
                expect(actual['errorCode']).to eql(104)
                expect(actual['errorMessage']).to eql("You don't have any feature flag")
            end
        end
    end
end
