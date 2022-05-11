Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13BB7523038
	for <lists+linux-ide@lfdr.de>; Wed, 11 May 2022 12:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbiEKKFP (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Wed, 11 May 2022 06:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiEKKFN (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Wed, 11 May 2022 06:05:13 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEE05DA0C;
        Wed, 11 May 2022 03:05:11 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id c11so1375947plg.13;
        Wed, 11 May 2022 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dl2s8Tv2/kKkPRE8ZoHeNUZB1flbWNAHTlntidklYaY=;
        b=KlIsnrMl6LzKnPwuuLyOxZLp19pZPqeI5Z4V8cuAYHI+9RVTGzbduTyCxz28BfMcY5
         CwyO3hIQASgaBQ4kvhQxLyYSbckbWRlCLb1dD/BMJSrScuRjQHw7frIEqtCsYUwV0aJo
         alk0g68BL70ZuQYOvBt58YRDPJ1xZn3xnx/SNkP8njfG7szgY0Hu9RRaME/VZH7+xzfW
         9YmVvFN9yJDIXLpbXehLIFtj0nsBlM+xlrmaYop1xZL6z0w8gbSOGA+RryCui01GAuoH
         cnWXREB1+3Q/d1q3pf62BP3GXl9AVtphO3G/fEuwafxxWxfxd2TZKvoEk0cxfjqDDCHb
         RZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dl2s8Tv2/kKkPRE8ZoHeNUZB1flbWNAHTlntidklYaY=;
        b=YEZOaKcvCruFRJUUeXH2uTSQvQVmgTEuZb1p4KVD43ClnU8v4+iwSzZwrTVl4UG+k8
         YXPLwZVFe+YP1TNjusIE0wyBs4R2cidIMfeq6BHD8hT+ei4mvE9WL+BIieI3whnBMD2A
         ILLJy2xNwA2BEi9OUTpgqTB9Q+sRpzk2OmAQWfKVnB5J7KMsj4CKyq04W7idzrydZcDz
         xGBPIpr6vCVmWpD95aD0oQLWLla2Lx7TQiCz8NOOqrxOFz/8YNAJAe9zTAMtB8eExzUF
         ZDf36kgn5ntrN3vDx3zFrGLLA4hLFlSUvT8rLftBRKezjT5nrp1ygo1dJByidVpoTNPZ
         twBw==
X-Gm-Message-State: AOAM530tHHIECZjogysmOdLT5/rKQ5SHXLqG02TND05Ndkej7na8Pzj3
        Xp3wDlQtKsCB5BokFbu9v9aUNMhzSYPyBg==
X-Google-Smtp-Source: ABdhPJxrR1W/gIbDjmZ7/+hWQ3pnc2AjtEKGxX+igDjmtKyPWlr1/5lfQ6qKTWVrO1rYmy4ogJ7Jlw==
X-Received: by 2002:a17:90b:d91:b0:1da:35d7:a0c with SMTP id bg17-20020a17090b0d9100b001da35d70a0cmr4565541pjb.92.1652263510558;
        Wed, 11 May 2022 03:05:10 -0700 (PDT)
Received: from hyeyoo ([114.29.24.243])
        by smtp.gmail.com with ESMTPSA id i20-20020a63cd14000000b003c291b46f7esm1330537pgg.18.2022.05.11.03.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 03:05:09 -0700 (PDT)
Date:   Wed, 11 May 2022 19:04:51 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Byungchul Park <byungchul.park@lge.com>
Cc:     torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com,
        linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
        linux-ext4@vger.kernel.org, mingo@redhat.com,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org,
        joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch,
        chris@chris-wilson.co.uk, duyuyang@gmail.com,
        johannes.berg@intel.com, tj@kernel.org, tytso@mit.edu,
        willy@infradead.org, david@fromorbit.com, amir73il@gmail.com,
        gregkh@linuxfoundation.org, kernel-team@lge.com,
        linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
        minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
        sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
        penberg@kernel.org, rientjes@google.com, vbabka@suse.cz,
        ngupta@vflare.org, linux-block@vger.kernel.org,
        paolo.valente@linaro.org, josef@toxicpanda.com,
        linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk,
        jack@suse.cz, jack@suse.com, jlayton@kernel.org,
        dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
        dri-devel@lists.freedesktop.org, airlied@linux.ie,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com, catalin.marinas@arm.com
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <YnuKQ9UIhk9WYoz7@hyeyoo>
References: <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
 <1651795895-8641-1-git-send-email-byungchul.park@lge.com>
 <YnYd0hd+yTvVQxm5@hyeyoo>
 <20220509001637.GA6047@X58A-UD3R>
 <YnpJ9Mtf+pjx4JYm@hyeyoo>
 <20220510233929.GB18445@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510233929.GB18445@X58A-UD3R>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

On Wed, May 11, 2022 at 08:39:29AM +0900, Byungchul Park wrote:
> On Tue, May 10, 2022 at 08:18:12PM +0900, Hyeonggon Yoo wrote:
> > On Mon, May 09, 2022 at 09:16:37AM +0900, Byungchul Park wrote:
> > > On Sat, May 07, 2022 at 04:20:50PM +0900, Hyeonggon Yoo wrote:
> > > > On Fri, May 06, 2022 at 09:11:35AM +0900, Byungchul Park wrote:
> > > > > Linus wrote:
> > > > > >
> > > > > > On Wed, May 4, 2022 at 1:19 AM Byungchul Park <byungchul.park@lge.com> wrote:
> > > > > > >
> > > > > > > Hi Linus and folks,
> > > > > > >
> > > > > > > I've been developing a tool for detecting deadlock possibilities by
> > > > > > > tracking wait/event rather than lock(?) acquisition order to try to
> > > > > > > cover all synchonization machanisms.
> > > > > > 
> > > > > > So what is the actual status of reports these days?
> > > > > > 
> > > > > > Last time I looked at some reports, it gave a lot of false positives
> > > > > > due to mis-understanding prepare_to_sleep().
> > > > > 
> > > > > Yes, it was. I handled the case in the following way:
> > > > > 
> > > > > 1. Stage the wait at prepare_to_sleep(), which might be used at commit.
> > > > >    Which has yet to be an actual wait that Dept considers.
> > > > > 2. If the condition for sleep is true, the wait will be committed at
> > > > >    __schedule(). The wait becomes an actual one that Dept considers.
> > > > > 3. If the condition is false and the task gets back to TASK_RUNNING,
> > > > >    clean(=reset) the staged wait.
> > > > > 
> > > > > That way, Dept only works with what actually hits to __schedule() for
> > > > > the waits through sleep.
> > > > > 
> > > > > > For this all to make sense, it would need to not have false positives
> > > > > > (or at least a very small number of them together with a way to sanely
> > > > > 
> > > > > Yes. I agree with you. I got rid of them that way I described above.
> > > > >
> > > > 
> > > > IMHO DEPT should not report what lockdep allows (Not talking about
> > > 
> > > No.
> > > 
> > > > wait events). I mean lockdep allows some kind of nested locks but
> > > > DEPT reports them.
> > > 
> > > You have already asked exactly same question in another thread of
> > > LKML. That time I answered to it but let me explain it again.
> > > 
> > > ---
> > > 
> > > CASE 1.
> > > 
> > >    lock L with depth n
> > >    lock_nested L' with depth n + 1
> > >    ...
> > >    unlock L'
> > >    unlock L
> > > 
> > > This case is allowed by Lockdep.
> > > This case is allowed by DEPT cuz it's not a deadlock.
> > > 
> > > CASE 2.
> > > 
> > >    lock L with depth n
> > >    lock A
> > >    lock_nested L' with depth n + 1
> > >    ...
> > >    unlock L'
> > >    unlock A
> > >    unlock L
> > > 
> > > This case is allowed by Lockdep.
> > > This case is *NOT* allowed by DEPT cuz it's a *DEADLOCK*.
> > >
> > 
> > Yeah, in previous threads we discussed this [1]
> > 
> > And the case was:
> > 	scan_mutex -> object_lock -> kmemleak_lock -> object_lock
> > And dept reported:
> > 	object_lock -> kmemleak_lock, kmemleak_lock -> object_lock as
> > 	deadlock.
> > 
> > But IIUC - What DEPT reported happens only under scan_mutex and
> > It is not simple just not to take them because the object can be removed from the
> > list and freed while scanning via kmemleak_free() without kmemleak_lock and object_lock.
>
>
> That should be one of the following order:
> 
> 1. kmemleak_lock -> object_lock -> object_lock(nested)
> 2. object_lock -> object_lock(nested) -> kmemleak_lock
> 
> > Just I'm still not sure that someone will fix the warning in the future - even if the
> > locking rule is not good - if it will not cause a real deadlock.
> 
> There's more important thing than making code just work for now. For
> example, maintainance, communcation via code between current developers
> and potential new commers in the future and so on.

Then we will get same reports from DEPT until already existing bad code (even if it does not
cause deadlock) is reworked. If you think that is right thing to do, okay.

> At least, a comment describing why the wrong order in the code is safe
> should be added.

AFAIK The comment is already there in mm/kmemleak.c.

> I wouldn't allow the current order in the code if I
> were the maintainer.

[+Cc Catalin]
He may have opinion.

Thanks,
Hyeonggon

> 	Byungchul
> 
> > > ---
> > > 
> > > The following scenario would explain why CASE 2 is problematic.
> > > 
> > >    THREAD X			THREAD Y
> > > 
> > >    lock L with depth n
> > > 				lock L' with depth n
> > >    lock A
> > > 				lock A
> > >    lock_nested L' with depth n + 1
> > > 				lock_nested L'' with depth n + 1
> > >    ...				...
> > >    unlock L'			unlock L''
> > >    unlock A			unlock A
> > >    unlock L			unlock L'
> > > 
> > > Yes. I need to check if the report you shared with me is a true one, but
> > > it's not because DEPT doesn't work with *_nested() APIs.
> > >
> > 
> > Sorry, It was not right just to say DEPT doesn't work with _nested() APIs.
> > 
> > > 	Byungchul
> > 
> > [1] https://lore.kernel.org/lkml/20220304002809.GA6112@X58A-UD3R/
> > 
> > -- 
> > Thanks,
> > Hyeonggon

-- 
Thanks,
Hyeonggon
