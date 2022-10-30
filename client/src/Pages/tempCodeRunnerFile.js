<MDBCardText className="small text-muted mb-0">
                        {followStatus ? (
                          <Button variant="contained" color="success">
                            Following
                          </Button>
                        ) : (
                          <Button
                            variant="outlined"
                            color="success"
                            onClick={followHandler}
                          >
                            Follow
                          </Button>
                        )}
                      </MDBCardText>