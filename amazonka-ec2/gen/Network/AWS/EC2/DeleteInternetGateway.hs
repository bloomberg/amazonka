{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.DeleteInternetGateway
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified Internet gateway. You must detach the Internet
-- gateway from the VPC before you can delete it.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DeleteInternetGateway.html>
module Network.AWS.EC2.DeleteInternetGateway
    (
    -- * Request
      DeleteInternetGateway
    -- ** Request constructor
    , deleteInternetGateway
    -- ** Request lenses
    , dig1DryRun
    , dig1InternetGatewayId

    -- * Response
    , DeleteInternetGatewayResponse
    -- ** Response constructor
    , deleteInternetGatewayResponse
    ) where

import           Network.AWS.EC2.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteInternetGateway' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dig1DryRun'
--
-- * 'dig1InternetGatewayId'
data DeleteInternetGateway = DeleteInternetGateway'
    { _dig1DryRun            :: !(Maybe Bool)
    , _dig1InternetGatewayId :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteInternetGateway' smart constructor.
deleteInternetGateway :: Text -> DeleteInternetGateway
deleteInternetGateway pInternetGatewayId =
    DeleteInternetGateway'
    { _dig1DryRun = Nothing
    , _dig1InternetGatewayId = pInternetGatewayId
    }

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
dig1DryRun :: Lens' DeleteInternetGateway (Maybe Bool)
dig1DryRun = lens _dig1DryRun (\ s a -> s{_dig1DryRun = a});

-- | The ID of the Internet gateway.
dig1InternetGatewayId :: Lens' DeleteInternetGateway Text
dig1InternetGatewayId = lens _dig1InternetGatewayId (\ s a -> s{_dig1InternetGatewayId = a});

instance AWSRequest DeleteInternetGateway where
        type Sv DeleteInternetGateway = EC2
        type Rs DeleteInternetGateway =
             DeleteInternetGatewayResponse
        request = post
        response = receiveNull DeleteInternetGatewayResponse'

instance ToHeaders DeleteInternetGateway where
        toHeaders = const mempty

instance ToPath DeleteInternetGateway where
        toPath = const "/"

instance ToQuery DeleteInternetGateway where
        toQuery DeleteInternetGateway'{..}
          = mconcat
              ["Action" =: ("DeleteInternetGateway" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "DryRun" =: _dig1DryRun,
               "InternetGatewayId" =: _dig1InternetGatewayId]

-- | /See:/ 'deleteInternetGatewayResponse' smart constructor.
data DeleteInternetGatewayResponse =
    DeleteInternetGatewayResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteInternetGatewayResponse' smart constructor.
deleteInternetGatewayResponse :: DeleteInternetGatewayResponse
deleteInternetGatewayResponse = DeleteInternetGatewayResponse'
