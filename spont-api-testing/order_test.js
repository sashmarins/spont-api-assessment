const chai = require("chai");
const chaiHttp = require("chai-http");
const expect = chai.expect
const baseUrl = "http://localhost:3000/"
chai.use(chaiHttp);
describe("Rocket Elevators Java API Unit Test", function(){
        var blogId;
        var blogBody = {
                "user_id": 2,
                "title": "felixBlog",
                "content": "testing777"
        };
        it('create a new blog', function(done) {
            chai.request(baseUrl)
            .post('/blogs.json')
            .send(blogBody)
            .end(function (err, res) {
                expect(res).to.have.status(200);
                expect(res.body.user_id).to.equal(blogBody.user_id);
                expect(res.body.title).to.equal(blogBody.title);
                expect(res.body.content).to.equal(blogBody.content);
                blogId = res.body.id;
                done();
            });
        });
        it('get an blog by ID', function(done) {
            chai.request(baseUrl)
            .get(`/blogs/${blogId}.json`)
            .end(function (err, res) {
                expect(res).to.have.status(200);
                expect(res.body).to.have.property("id");
                expect(res.body.id).to.equal(blogId);
                expect(res.body.user_id).to.equal(blogBody.user_id);
                expect(res.body.content).to.equal(blogBody.content);
                done();
            });
        });
        it('get all blogs', function(done) {
            chai.request(baseUrl)
            .get('/blogs.json')
            .end(function (err, res) {
                expect(res).to.have.status(200);
                expect(res.body).to.be.an("array");
                const blog = res.body.find(i=>i.id==blogId)
                expect(blog).to.be.an("object")
                expect(blog).to.have.property("id")
                done();
            });
        });
        var updateBlogBody = {
                "content": "testing the patch method"
        }
        it('update an blog', function(done) {
            chai.request(baseUrl)
            .patch(`/blogs/${blogId}.json`)
            .send(updateBlogBody)
            .end(function (err, res) {
                expect(res).to.have.status(200);
                expect(res.body).to.have.property("id");
                expect(res.body.content).to.equal(updateBlogBody.content);
                done();
            });
        });
        it('delete an blog by ID', function(done) {
            chai.request(baseUrl)
            .delete(`/blogs/${blogId}.json`)
            .end(function (err, res) {
                expect(res).to.have.status(204);
                chai.request(baseUrl)
                .get(`/blogs/${blogId}.json`)
                .end(function (err, res) {
                    expect(res).to.have.status(404);
                    done();
                });
            });
        });
})