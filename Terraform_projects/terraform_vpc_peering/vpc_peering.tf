resource "aws_vpc_peering_connection" "my-peering" {
  peer_vpc_id   = aws_vpc.paris_vpc.id     # target_vpc_id
  vpc_id        = aws_vpc.ohio_vpc.id      # requestor vpc id
  peer_region   = "eu-west-3"
  auto_accept = false  
  depends_on = [ aws_vpc.ohio_vpc, aws_vpc.paris_vpc ]
  provider = aws.ohio
  tags = {
    Side = "Requestor"
  }
}
resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = aws_vpc_peering_connection.my-peering.id
  auto_accept               = true
  depends_on = [ aws_vpc.ohio_vpc, aws_vpc.paris_vpc ]
  provider = aws.paris

  tags = {
    Side = "Accepter"
  }
}