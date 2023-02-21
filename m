Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2313569E54D
	for <lists+linux-ide@lfdr.de>; Tue, 21 Feb 2023 17:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbjBUQ6s (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 21 Feb 2023 11:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234899AbjBUQ6o (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 21 Feb 2023 11:58:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FE7233C0
        for <linux-ide@vger.kernel.org>; Tue, 21 Feb 2023 08:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676998672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UBi/Vc+mRROdrEC455aN+NdpNW+dE+GmksUXJel4JK4=;
        b=eIHZLlBsnZBXSD2VI3z65sFQLbmZwpIe0HKhyzy0LBDLniJN/+dN1HwlkN8vS4tCFUc2U5
        amJU/IW2mghdXIg8Ievsy5TVFPKOFtHooZ10kAlTHZluC7XYPQNcMxmagGMApRTy8kjfRT
        fUq+tmipTNhRco1yn0uV3QE8tnJJykU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-OLf3luQ8M36JB5-LMaE-cg-1; Tue, 21 Feb 2023 11:57:46 -0500
X-MC-Unique: OLf3luQ8M36JB5-LMaE-cg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29062100F90A;
        Tue, 21 Feb 2023 16:57:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 13F98492B05;
        Tue, 21 Feb 2023 16:57:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <Y9KtCc+4n5uANB2f@casper.infradead.org>
References: <Y9KtCc+4n5uANB2f@casper.infradead.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     dhowells@redhat.com, lsf-pc@lists.linux-foundation.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-nvme@lists.infradead.org,
        bpf@vger.kernel.org
Subject: Re: [LSF/MM/BPF TOPIC] State Of The Page
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2897037.1676998663.1@warthog.procyon.org.uk>
Date:   Tue, 21 Feb 2023 16:57:43 +0000
Message-ID: <2897038.1676998663@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Matthew Wilcox <willy@infradead.org> wrote:

> I'd like to do another session on how the struct page dismemberment
> is going and what remains to be done.  Given how widely struct page is
> used, I think there will be interest from more than just MM, so I'd
> suggest a plenary session.

I'd certainly be interested in that.  I've recently been looking into
improving folio support in various places, including now splice and pipes.

David

