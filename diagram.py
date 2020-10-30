from diagrams import Diagram, Cluster
from diagrams.aws.storage import S3

with Diagram("AWS S3 Bucket", show=False, direction="TB"):

    S3("s3 bucket") << S3("public access block")
