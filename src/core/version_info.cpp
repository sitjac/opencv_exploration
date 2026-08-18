#include "visionlab/version_info.hpp"

#include <opencv2/core.hpp>

#include <sstream>

namespace visionlab
{
  std::string version_info()
  {
    std::ostringstream oss;
    oss << "visionlab SDK version: " << VISIONLAB_SDK_VERSION << '\n';
    oss << "OpenCV version: " << cv::getVersionString() << '\n';
    return oss.str();
  }
}  // namespace visionlab
