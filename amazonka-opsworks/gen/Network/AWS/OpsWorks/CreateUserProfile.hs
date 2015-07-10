{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.OpsWorks.CreateUserProfile
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Creates a new user profile.
--
-- __Required Permissions__: To use this action, an IAM user must have an
-- attached policy that explicitly grants permissions. For more information
-- on user permissions, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html Managing User Permissions>.
--
-- <http://docs.aws.amazon.com/opsworks/latest/APIReference/API_CreateUserProfile.html>
module Network.AWS.OpsWorks.CreateUserProfile
    (
    -- * Request
      CreateUserProfile
    -- ** Request constructor
    , createUserProfile
    -- ** Request lenses
    , cupSSHUsername
    , cupSSHPublicKey
    , cupAllowSelfManagement
    , cupIAMUserARN

    -- * Response
    , CreateUserProfileResponse
    -- ** Response constructor
    , createUserProfileResponse
    -- ** Response lenses
    , cuprIAMUserARN
    , cuprStatus
    ) where

import           Network.AWS.OpsWorks.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'createUserProfile' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cupSSHUsername'
--
-- * 'cupSSHPublicKey'
--
-- * 'cupAllowSelfManagement'
--
-- * 'cupIAMUserARN'
data CreateUserProfile = CreateUserProfile'
    { _cupSSHUsername         :: !(Maybe Text)
    , _cupSSHPublicKey        :: !(Maybe Text)
    , _cupAllowSelfManagement :: !(Maybe Bool)
    , _cupIAMUserARN          :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CreateUserProfile' smart constructor.
createUserProfile :: Text -> CreateUserProfile
createUserProfile pIAMUserARN =
    CreateUserProfile'
    { _cupSSHUsername = Nothing
    , _cupSSHPublicKey = Nothing
    , _cupAllowSelfManagement = Nothing
    , _cupIAMUserARN = pIAMUserARN
    }

-- | The user\'s SSH user name. The allowable characters are [a-z], [A-Z],
-- [0-9], \'-\', and \'_\'. If the specified name includes other
-- punctuation marks, AWS OpsWorks removes them. For example, @my.name@
-- will be changed to @myname@. If you do not specify an SSH user name, AWS
-- OpsWorks generates one from the IAM user name.
cupSSHUsername :: Lens' CreateUserProfile (Maybe Text)
cupSSHUsername = lens _cupSSHUsername (\ s a -> s{_cupSSHUsername = a});

-- | The user\'s public SSH key.
cupSSHPublicKey :: Lens' CreateUserProfile (Maybe Text)
cupSSHPublicKey = lens _cupSSHPublicKey (\ s a -> s{_cupSSHPublicKey = a});

-- | Whether users can specify their own SSH public key through the My
-- Settings page. For more information, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/security-settingsshkey.html Setting an IAM User\'s Public SSH Key>.
cupAllowSelfManagement :: Lens' CreateUserProfile (Maybe Bool)
cupAllowSelfManagement = lens _cupAllowSelfManagement (\ s a -> s{_cupAllowSelfManagement = a});

-- | The user\'s IAM ARN.
cupIAMUserARN :: Lens' CreateUserProfile Text
cupIAMUserARN = lens _cupIAMUserARN (\ s a -> s{_cupIAMUserARN = a});

instance AWSRequest CreateUserProfile where
        type Sv CreateUserProfile = OpsWorks
        type Rs CreateUserProfile = CreateUserProfileResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 CreateUserProfileResponse' <$>
                   (x .?> "IamUserArn") <*> (pure (fromEnum s)))

instance ToHeaders CreateUserProfile where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OpsWorks_20130218.CreateUserProfile" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON CreateUserProfile where
        toJSON CreateUserProfile'{..}
          = object
              ["SshUsername" .= _cupSSHUsername,
               "SshPublicKey" .= _cupSSHPublicKey,
               "AllowSelfManagement" .= _cupAllowSelfManagement,
               "IamUserArn" .= _cupIAMUserARN]

instance ToPath CreateUserProfile where
        toPath = const "/"

instance ToQuery CreateUserProfile where
        toQuery = const mempty

-- | Contains the response to a @CreateUserProfile@ request.
--
-- /See:/ 'createUserProfileResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cuprIAMUserARN'
--
-- * 'cuprStatus'
data CreateUserProfileResponse = CreateUserProfileResponse'
    { _cuprIAMUserARN :: !(Maybe Text)
    , _cuprStatus     :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CreateUserProfileResponse' smart constructor.
createUserProfileResponse :: Int -> CreateUserProfileResponse
createUserProfileResponse pStatus =
    CreateUserProfileResponse'
    { _cuprIAMUserARN = Nothing
    , _cuprStatus = pStatus
    }

-- | The user\'s IAM ARN.
cuprIAMUserARN :: Lens' CreateUserProfileResponse (Maybe Text)
cuprIAMUserARN = lens _cuprIAMUserARN (\ s a -> s{_cuprIAMUserARN = a});

-- | FIXME: Undocumented member.
cuprStatus :: Lens' CreateUserProfileResponse Int
cuprStatus = lens _cuprStatus (\ s a -> s{_cuprStatus = a});
