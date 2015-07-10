{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SSM.ListAssociations
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Lists the associations for the specified configuration document or
-- instance.
--
-- <http://docs.aws.amazon.com/ssm/latest/APIReference/API_ListAssociations.html>
module Network.AWS.SSM.ListAssociations
    (
    -- * Request
      ListAssociations
    -- ** Request constructor
    , listAssociations
    -- ** Request lenses
    , laNextToken
    , laMaxResults
    , laAssociationFilterList

    -- * Response
    , ListAssociationsResponse
    -- ** Response constructor
    , listAssociationsResponse
    -- ** Response lenses
    , larNextToken
    , larAssociations
    , larStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SSM.Types

-- | /See:/ 'listAssociations' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'laNextToken'
--
-- * 'laMaxResults'
--
-- * 'laAssociationFilterList'
data ListAssociations = ListAssociations'
    { _laNextToken             :: !(Maybe Text)
    , _laMaxResults            :: !(Maybe Nat)
    , _laAssociationFilterList :: !(List1 AssociationFilter)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ListAssociations' smart constructor.
listAssociations :: NonEmpty AssociationFilter -> ListAssociations
listAssociations pAssociationFilterList =
    ListAssociations'
    { _laNextToken = Nothing
    , _laMaxResults = Nothing
    , _laAssociationFilterList = _List1 # pAssociationFilterList
    }

-- | The token for the next set of items to return. (You received this token
-- from a previous call.)
laNextToken :: Lens' ListAssociations (Maybe Text)
laNextToken = lens _laNextToken (\ s a -> s{_laNextToken = a});

-- | The maximum number of items to return for this call. The call also
-- returns a token that you can specify in a subsequent call to get the
-- next set of results.
laMaxResults :: Lens' ListAssociations (Maybe Natural)
laMaxResults = lens _laMaxResults (\ s a -> s{_laMaxResults = a}) . mapping _Nat;

-- | One or more filters. Use a filter to return a more specific list of
-- results.
laAssociationFilterList :: Lens' ListAssociations (NonEmpty AssociationFilter)
laAssociationFilterList = lens _laAssociationFilterList (\ s a -> s{_laAssociationFilterList = a}) . _List1;

instance AWSRequest ListAssociations where
        type Sv ListAssociations = SSM
        type Rs ListAssociations = ListAssociationsResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 ListAssociationsResponse' <$>
                   (x .?> "NextToken") <*>
                     (x .?> "Associations" .!@ mempty)
                     <*> (pure (fromEnum s)))

instance ToHeaders ListAssociations where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonSSM.ListAssociations" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON ListAssociations where
        toJSON ListAssociations'{..}
          = object
              ["NextToken" .= _laNextToken,
               "MaxResults" .= _laMaxResults,
               "AssociationFilterList" .= _laAssociationFilterList]

instance ToPath ListAssociations where
        toPath = const "/"

instance ToQuery ListAssociations where
        toQuery = const mempty

-- | /See:/ 'listAssociationsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'larNextToken'
--
-- * 'larAssociations'
--
-- * 'larStatus'
data ListAssociationsResponse = ListAssociationsResponse'
    { _larNextToken    :: !(Maybe Text)
    , _larAssociations :: !(Maybe [Association])
    , _larStatus       :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ListAssociationsResponse' smart constructor.
listAssociationsResponse :: Int -> ListAssociationsResponse
listAssociationsResponse pStatus =
    ListAssociationsResponse'
    { _larNextToken = Nothing
    , _larAssociations = Nothing
    , _larStatus = pStatus
    }

-- | The token to use when requesting the next set of items. If there are no
-- additional items to return, the string is empty.
larNextToken :: Lens' ListAssociationsResponse (Maybe Text)
larNextToken = lens _larNextToken (\ s a -> s{_larNextToken = a});

-- | The associations.
larAssociations :: Lens' ListAssociationsResponse [Association]
larAssociations = lens _larAssociations (\ s a -> s{_larAssociations = a}) . _Default;

-- | FIXME: Undocumented member.
larStatus :: Lens' ListAssociationsResponse Int
larStatus = lens _larStatus (\ s a -> s{_larStatus = a});
