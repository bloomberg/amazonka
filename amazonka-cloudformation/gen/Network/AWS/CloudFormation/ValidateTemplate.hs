{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CloudFormation.ValidateTemplate
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Validates a specified template.
--
-- <http://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ValidateTemplate.html>
module Network.AWS.CloudFormation.ValidateTemplate
    (
    -- * Request
      ValidateTemplate
    -- ** Request constructor
    , validateTemplate
    -- ** Request lenses
    , vtTemplateBody
    , vtTemplateURL

    -- * Response
    , ValidateTemplateResponse
    -- ** Response constructor
    , validateTemplateResponse
    -- ** Response lenses
    , vtrParameters
    , vtrCapabilitiesReason
    , vtrCapabilities
    , vtrDescription
    , vtrStatus
    ) where

import           Network.AWS.CloudFormation.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | The input for ValidateTemplate action.
--
-- /See:/ 'validateTemplate' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'vtTemplateBody'
--
-- * 'vtTemplateURL'
data ValidateTemplate = ValidateTemplate'
    { _vtTemplateBody :: !(Maybe Text)
    , _vtTemplateURL  :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ValidateTemplate' smart constructor.
validateTemplate :: ValidateTemplate
validateTemplate =
    ValidateTemplate'
    { _vtTemplateBody = Nothing
    , _vtTemplateURL = Nothing
    }

-- | Structure containing the template body with a minimum length of 1 byte
-- and a maximum length of 51,200 bytes. For more information, go to
-- <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html Template Anatomy>
-- in the AWS CloudFormation User Guide.
--
-- Conditional: You must pass @TemplateURL@ or @TemplateBody@. If both are
-- passed, only @TemplateBody@ is used.
vtTemplateBody :: Lens' ValidateTemplate (Maybe Text)
vtTemplateBody = lens _vtTemplateBody (\ s a -> s{_vtTemplateBody = a});

-- | Location of file containing the template body. The URL must point to a
-- template (max size: 460,800 bytes) located in an S3 bucket in the same
-- region as the stack. For more information, go to
-- <http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html Template Anatomy>
-- in the AWS CloudFormation User Guide.
--
-- Conditional: You must pass @TemplateURL@ or @TemplateBody@. If both are
-- passed, only @TemplateBody@ is used.
vtTemplateURL :: Lens' ValidateTemplate (Maybe Text)
vtTemplateURL = lens _vtTemplateURL (\ s a -> s{_vtTemplateURL = a});

instance AWSRequest ValidateTemplate where
        type Sv ValidateTemplate = CloudFormation
        type Rs ValidateTemplate = ValidateTemplateResponse
        request = post
        response
          = receiveXMLWrapper "ValidateTemplateResult"
              (\ s h x ->
                 ValidateTemplateResponse' <$>
                   (x .@? "Parameters" .!@ mempty >>=
                      may (parseXMLList "member"))
                     <*> (x .@? "CapabilitiesReason")
                     <*>
                     (x .@? "Capabilities" .!@ mempty >>=
                        may (parseXMLList "member"))
                     <*> (x .@? "Description")
                     <*> (pure (fromEnum s)))

instance ToHeaders ValidateTemplate where
        toHeaders = const mempty

instance ToPath ValidateTemplate where
        toPath = const "/"

instance ToQuery ValidateTemplate where
        toQuery ValidateTemplate'{..}
          = mconcat
              ["Action" =: ("ValidateTemplate" :: ByteString),
               "Version" =: ("2010-05-15" :: ByteString),
               "TemplateBody" =: _vtTemplateBody,
               "TemplateURL" =: _vtTemplateURL]

-- | The output for ValidateTemplate action.
--
-- /See:/ 'validateTemplateResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'vtrParameters'
--
-- * 'vtrCapabilitiesReason'
--
-- * 'vtrCapabilities'
--
-- * 'vtrDescription'
--
-- * 'vtrStatus'
data ValidateTemplateResponse = ValidateTemplateResponse'
    { _vtrParameters         :: !(Maybe [TemplateParameter])
    , _vtrCapabilitiesReason :: !(Maybe Text)
    , _vtrCapabilities       :: !(Maybe [Capability])
    , _vtrDescription        :: !(Maybe Text)
    , _vtrStatus             :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ValidateTemplateResponse' smart constructor.
validateTemplateResponse :: Int -> ValidateTemplateResponse
validateTemplateResponse pStatus =
    ValidateTemplateResponse'
    { _vtrParameters = Nothing
    , _vtrCapabilitiesReason = Nothing
    , _vtrCapabilities = Nothing
    , _vtrDescription = Nothing
    , _vtrStatus = pStatus
    }

-- | A list of @TemplateParameter@ structures.
vtrParameters :: Lens' ValidateTemplateResponse [TemplateParameter]
vtrParameters = lens _vtrParameters (\ s a -> s{_vtrParameters = a}) . _Default;

-- | The list of resources that generated the values in the @Capabilities@
-- response element.
vtrCapabilitiesReason :: Lens' ValidateTemplateResponse (Maybe Text)
vtrCapabilitiesReason = lens _vtrCapabilitiesReason (\ s a -> s{_vtrCapabilitiesReason = a});

-- | The capabilities found within the template. Currently, AWS
-- CloudFormation supports only the CAPABILITY_IAM capability. If your
-- template contains IAM resources, you must specify the CAPABILITY_IAM
-- value for this parameter when you use the CreateStack or UpdateStack
-- actions with your template; otherwise, those actions return an
-- InsufficientCapabilities error.
vtrCapabilities :: Lens' ValidateTemplateResponse [Capability]
vtrCapabilities = lens _vtrCapabilities (\ s a -> s{_vtrCapabilities = a}) . _Default;

-- | The description found within the template.
vtrDescription :: Lens' ValidateTemplateResponse (Maybe Text)
vtrDescription = lens _vtrDescription (\ s a -> s{_vtrDescription = a});

-- | FIXME: Undocumented member.
vtrStatus :: Lens' ValidateTemplateResponse Int
vtrStatus = lens _vtrStatus (\ s a -> s{_vtrStatus = a});
