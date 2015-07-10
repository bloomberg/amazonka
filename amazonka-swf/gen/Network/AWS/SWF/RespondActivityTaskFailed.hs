{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SWF.RespondActivityTaskFailed
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Used by workers to tell the service that the ActivityTask identified by
-- the @taskToken@ has failed with @reason@ (if specified). The @reason@
-- and @details@ appear in the @ActivityTaskFailed@ event added to the
-- workflow history.
--
-- A task is considered open from the time that it is scheduled until it is
-- closed. Therefore a task is reported as open while a worker is
-- processing it. A task is closed after it has been specified in a call to
-- RespondActivityTaskCompleted, RespondActivityTaskCanceled,
-- RespondActivityTaskFailed, or the task has
-- <http://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types timed out>.
--
-- __Access Control__
--
-- You can use IAM policies to control this action\'s access to Amazon SWF
-- resources as follows:
--
-- -   Use a @Resource@ element with the domain name to limit the action to
--     only specified domains.
-- -   Use an @Action@ element to allow or deny permission to call this
--     action.
-- -   You cannot use an IAM policy to constrain this action\'s parameters.
--
-- If the caller does not have sufficient permissions to invoke the action,
-- or the parameter values fall outside the specified constraints, the
-- action fails. The associated event attribute\'s __cause__ parameter will
-- be set to OPERATION_NOT_PERMITTED. For details and example IAM policies,
-- see
-- <http://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html Using IAM to Manage Access to Amazon SWF Workflows>.
--
-- <http://docs.aws.amazon.com/amazonswf/latest/apireference/API_RespondActivityTaskFailed.html>
module Network.AWS.SWF.RespondActivityTaskFailed
    (
    -- * Request
      RespondActivityTaskFailed
    -- ** Request constructor
    , respondActivityTaskFailed
    -- ** Request lenses
    , ratfReason
    , ratfDetails
    , ratfTaskToken

    -- * Response
    , RespondActivityTaskFailedResponse
    -- ** Response constructor
    , respondActivityTaskFailedResponse
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SWF.Types

-- | /See:/ 'respondActivityTaskFailed' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ratfReason'
--
-- * 'ratfDetails'
--
-- * 'ratfTaskToken'
data RespondActivityTaskFailed = RespondActivityTaskFailed'
    { _ratfReason    :: !(Maybe Text)
    , _ratfDetails   :: !(Maybe Text)
    , _ratfTaskToken :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'RespondActivityTaskFailed' smart constructor.
respondActivityTaskFailed :: Text -> RespondActivityTaskFailed
respondActivityTaskFailed pTaskToken =
    RespondActivityTaskFailed'
    { _ratfReason = Nothing
    , _ratfDetails = Nothing
    , _ratfTaskToken = pTaskToken
    }

-- | Description of the error that may assist in diagnostics.
ratfReason :: Lens' RespondActivityTaskFailed (Maybe Text)
ratfReason = lens _ratfReason (\ s a -> s{_ratfReason = a});

-- | /Optional./ Detailed information about the failure.
ratfDetails :: Lens' RespondActivityTaskFailed (Maybe Text)
ratfDetails = lens _ratfDetails (\ s a -> s{_ratfDetails = a});

-- | The @taskToken@ of the ActivityTask.
--
-- @taskToken@ is generated by the service and should be treated as an
-- opaque value. If the task is passed to another process, its @taskToken@
-- must also be passed. This enables it to provide its progress and respond
-- with results.
ratfTaskToken :: Lens' RespondActivityTaskFailed Text
ratfTaskToken = lens _ratfTaskToken (\ s a -> s{_ratfTaskToken = a});

instance AWSRequest RespondActivityTaskFailed where
        type Sv RespondActivityTaskFailed = SWF
        type Rs RespondActivityTaskFailed =
             RespondActivityTaskFailedResponse
        request = postJSON
        response
          = receiveNull RespondActivityTaskFailedResponse'

instance ToHeaders RespondActivityTaskFailed where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("SimpleWorkflowService.RespondActivityTaskFailed" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.0" :: ByteString)])

instance ToJSON RespondActivityTaskFailed where
        toJSON RespondActivityTaskFailed'{..}
          = object
              ["reason" .= _ratfReason, "details" .= _ratfDetails,
               "taskToken" .= _ratfTaskToken]

instance ToPath RespondActivityTaskFailed where
        toPath = const "/"

instance ToQuery RespondActivityTaskFailed where
        toQuery = const mempty

-- | /See:/ 'respondActivityTaskFailedResponse' smart constructor.
data RespondActivityTaskFailedResponse =
    RespondActivityTaskFailedResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'RespondActivityTaskFailedResponse' smart constructor.
respondActivityTaskFailedResponse :: RespondActivityTaskFailedResponse
respondActivityTaskFailedResponse = RespondActivityTaskFailedResponse'
