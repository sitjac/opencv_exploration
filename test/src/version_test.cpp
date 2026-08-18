#include "visionlab/version_info.hpp"

#include <gtest/gtest.h>

TEST(VersionInfoTest, ContainsSdkAndOpenCvVersion)
{
  const std::string info = visionlab::version_info();
  EXPECT_NE(info.find("visionlab SDK version:"), std::string::npos);
  EXPECT_NE(info.find("OpenCV version:"), std::string::npos);
}

int main(int argc, char **argv)
{
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
