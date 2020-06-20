Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61972024F2
	for <lists+linux-clk@lfdr.de>; Sat, 20 Jun 2020 17:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgFTP5Q (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 20 Jun 2020 11:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgFTP5I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 20 Jun 2020 11:57:08 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC82C0613EF
        for <linux-clk@vger.kernel.org>; Sat, 20 Jun 2020 08:57:07 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d10so3489926pls.5
        for <linux-clk@vger.kernel.org>; Sat, 20 Jun 2020 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9tYajToBSjCKrMeO3oPfRpy8eb8n4thx7RWSAT9gnU0=;
        b=QDUi4+cS/+VkJarQJer8i54NB6wrYUApoWkctsr63KwWXWXArOZDidsHLokQDZp1dW
         eZ4mUUVqPLdtc98QdwYojIxlVjsSvdT6uJdK2Pr6SfHfX+CS5ufDjNUbv4fBIhf1Kcxv
         MQ/YY9T6qSNqLt4/98fJo5BCZXSyE37vzBS0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9tYajToBSjCKrMeO3oPfRpy8eb8n4thx7RWSAT9gnU0=;
        b=NCYbDCFvRDV111fXZw8Jp9jfoqYSLql6lsPxfKgrr/Kw/KES4X6KBcnlN1W8uknxEw
         mmuvumDjZ2YcMchdCB4ANkO8cpF8NMdG/WdFcOCQjFXHBnuXkbpNz91KZfeOZBLkZsRS
         ej5lYnFhVv7XQtQPGmZFG70r8Q9mAdj9lMb2z6/5IINE9Fr1P9m4h9A8HWSC++9TPnPP
         J8W87xcRk4nK18VofFbpAnyAGEXv/20NdcC4OX1dS4n/ko06EqAwSzadcZK6cfHdxeC2
         xa66Scvx9WchJntI46oer3Su7Luluj2P+MQETlgUpnkhLsf6Ab31yrfhp7bkgWhsPQK+
         RShg==
X-Gm-Message-State: AOAM530Z+P6uY1tdQVBhnizMVuN9naWptv0sUCzY2U9co2ubKjmdHsyX
        1ak0GpnJ5HHBgTrxla6+NaBrKA==
X-Google-Smtp-Source: ABdhPJxL62JhXi8o+nSID6QHqBiLZ4YAHSAeaQKUwiACFjUcLS2k4S/MAlD8WL4T8tKBotrZuujIYg==
X-Received: by 2002:a17:902:b78a:: with SMTP id e10mr12682612pls.201.1592668627259;
        Sat, 20 Jun 2020 08:57:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y4sm8954278pfr.182.2020.06.20.08.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 08:57:06 -0700 (PDT)
Date:   Sat, 20 Jun 2020 08:57:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>, x86@kernel.org,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        b43-dev@lists.infradead.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mm@kvack.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH v2 00/16] Remove uninitialized_var() macro
Message-ID: <202006200854.B2D8F21@keescook>
References: <20200620033007.1444705-1-keescook@chromium.org>
 <CA+icZUWpHRR7ukyepiUH1dR3r4GMi-s2crfwR5vTszdt1SUTQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUWpHRR7ukyepiUH1dR3r4GMi-s2crfwR5vTszdt1SUTQw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Jun 20, 2020 at 09:03:34AM +0200, Sedat Dilek wrote:
> On Sat, Jun 20, 2020 at 5:30 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > v2:
> > - more special-cased fixes
> > - add reviews
> > v1: https://lore.kernel.org/lkml/20200603233203.1695403-1-keescook@chromium.org
> >
> > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > (or can in the future), and suppresses unrelated compiler warnings
> > (e.g. "unused variable"). If the compiler thinks it is uninitialized,
> > either simply initialize the variable or make compiler changes.
> >
> > As recommended[2] by[3] Linus[4], remove the macro.
> >
> > Most of the 300 uses don't cause any warnings on gcc 9.3.0, so they're in
> > a single treewide commit in this series. A few others needed to actually
> > get cleaned up, and I broke those out into individual patches.
> >
> > The tree is:
> > https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=kspp/uninit/macro
> >
> > -Kees
> >
> 
> Hi Kees,
> 
> thanks for doing a v2 of your patchset.
> 
> As I saw Jason Yan providing some "uninitialized_var() macro" patches
> to the MLs I pointen him to your tree "v1".

Thanks!

> BTW, I have tested your "v1" against Linux v5.7 (see [1]) - just
> yesterday with Linux v5.7.5-rc1.
> 
> Is it possible to have a v2 of this patchset on top od Linux v5.7 - if
> you do not mind.

Since it's only going to be for post-v5.8, I'm fine skipping the v5.7
testing. Mainly I'm looking at v5.8 and linux-next.

Thanks for looking at it!

-- 
Kees Cook
