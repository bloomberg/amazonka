{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IAM.UpdateSAMLProvider
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Updates the metadata document for an existing SAML provider.
--
-- This operation requires
-- <http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html Signature Version 4>.
--
-- <http://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateSAMLProvider.html>
module Network.AWS.IAM.UpdateSAMLProvider
    (
    -- * Request
      UpdateSAMLProvider
    -- ** Request constructor
    , updateSAMLProvider
    -- ** Request lenses
    , usamlpSAMLMetadataDocument
    , usamlpSAMLProviderARN

    -- * Response
    , UpdateSAMLProviderResponse
    -- ** Response constructor
    , updateSAMLProviderResponse
    -- ** Response lenses
    , usamlprSAMLProviderARN
    , usamlprStatus
    ) where

import           Network.AWS.IAM.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'updateSAMLProvider' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'usamlpSAMLMetadataDocument'
--
-- * 'usamlpSAMLProviderARN'
data UpdateSAMLProvider = UpdateSAMLProvider'
    { _usamlpSAMLMetadataDocument :: !Text
    , _usamlpSAMLProviderARN      :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'UpdateSAMLProvider' smart constructor.
updateSAMLProvider :: Text -> Text -> UpdateSAMLProvider
updateSAMLProvider pSAMLMetadataDocument pSAMLProviderARN =
    UpdateSAMLProvider'
    { _usamlpSAMLMetadataDocument = pSAMLMetadataDocument
    , _usamlpSAMLProviderARN = pSAMLProviderARN
    }

-- | An XML document generated by an identity provider (IdP) that supports
-- SAML 2.0. The document includes the issuer\'s name, expiration
-- information, and keys that can be used to validate the SAML
-- authentication response (assertions) that are received from the IdP. You
-- must generate the metadata document using the identity management
-- software that is used as your organization\'s IdP.
usamlpSAMLMetadataDocument :: Lens' UpdateSAMLProvider Text
usamlpSAMLMetadataDocument = lens _usamlpSAMLMetadataDocument (\ s a -> s{_usamlpSAMLMetadataDocument = a});

-- | The Amazon Resource Name (ARN) of the SAML provider to update.
usamlpSAMLProviderARN :: Lens' UpdateSAMLProvider Text
usamlpSAMLProviderARN = lens _usamlpSAMLProviderARN (\ s a -> s{_usamlpSAMLProviderARN = a});

instance AWSRequest UpdateSAMLProvider where
        type Sv UpdateSAMLProvider = IAM
        type Rs UpdateSAMLProvider =
             UpdateSAMLProviderResponse
        request = post
        response
          = receiveXMLWrapper "UpdateSAMLProviderResult"
              (\ s h x ->
                 UpdateSAMLProviderResponse' <$>
                   (x .@? "SAMLProviderArn") <*> (pure (fromEnum s)))

instance ToHeaders UpdateSAMLProvider where
        toHeaders = const mempty

instance ToPath UpdateSAMLProvider where
        toPath = const "/"

instance ToQuery UpdateSAMLProvider where
        toQuery UpdateSAMLProvider'{..}
          = mconcat
              ["Action" =: ("UpdateSAMLProvider" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "SAMLMetadataDocument" =:
                 _usamlpSAMLMetadataDocument,
               "SAMLProviderArn" =: _usamlpSAMLProviderARN]

-- | Contains the response to a successful UpdateSAMLProvider request.
--
-- /See:/ 'updateSAMLProviderResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'usamlprSAMLProviderARN'
--
-- * 'usamlprStatus'
data UpdateSAMLProviderResponse = UpdateSAMLProviderResponse'
    { _usamlprSAMLProviderARN :: !(Maybe Text)
    , _usamlprStatus          :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'UpdateSAMLProviderResponse' smart constructor.
updateSAMLProviderResponse :: Int -> UpdateSAMLProviderResponse
updateSAMLProviderResponse pStatus =
    UpdateSAMLProviderResponse'
    { _usamlprSAMLProviderARN = Nothing
    , _usamlprStatus = pStatus
    }

-- | The Amazon Resource Name (ARN) of the SAML provider that was updated.
usamlprSAMLProviderARN :: Lens' UpdateSAMLProviderResponse (Maybe Text)
usamlprSAMLProviderARN = lens _usamlprSAMLProviderARN (\ s a -> s{_usamlprSAMLProviderARN = a});

-- | FIXME: Undocumented member.
usamlprStatus :: Lens' UpdateSAMLProviderResponse Int
usamlprStatus = lens _usamlprStatus (\ s a -> s{_usamlprStatus = a});
