Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F31FF56CB3B
	for <lists+linux-clk@lfdr.de>; Sat,  9 Jul 2022 21:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiGITOs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 9 Jul 2022 15:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiGITOs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 9 Jul 2022 15:14:48 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA2D1C91F
        for <linux-clk@vger.kernel.org>; Sat,  9 Jul 2022 12:14:47 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id cf13so654498qtb.13
        for <linux-clk@vger.kernel.org>; Sat, 09 Jul 2022 12:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=yFjPBwfof55JxbmPqLU/8pTY0KXsIbs+GUr373EysuM=;
        b=aPW2jAvVmuhNLR+c5htyB+zDi4OnTDULd1fxcN3eSTbHwJNEOOJgmj3fTYWk7vHHCh
         l1fvjuAxY3beLoJuryNCjix4noRjXUJ96flcnt0Ag3b/W7KNFAm6awKYiAo5K47q8kWt
         MeFmGc9M8gY62wmfmmi0RFya1KWEiH8+8MA4GFRapC/d8t8rVojKnISibCYnqA3uIC9n
         OPokFty2m5Y+Xj/czcYf58YtbU8T9JXUP4t4rrmkkaMmP4OIbOeI4cVOaGhhAia+7wfo
         rXUbuw846m1yySMZtfQrB/2vW8Mtx5yT0sCSD4sS3Ihg0txQGl/NxBD/U+Hb53LHRXY1
         dNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=yFjPBwfof55JxbmPqLU/8pTY0KXsIbs+GUr373EysuM=;
        b=oA1cLfTt+XDO8IPr4b+RxXu450fdhWRZbN0g0ElvBROREhT2PDbl7Rk4W7Bd2iw36g
         o6SdJkH0RsbWpmAh9Dl6RONAT4H8xLW72nlhUiKVpRNJayn+o9Pug2hRnLNSVFy5wkwC
         Ur4un50zbNf6+dUkIOIbITfzoZY7h8jFDV6BC+D6L++nyCUOCpAf38kKJPCFQW0SO9+B
         TKFVBorKBPyRqu6eC7TEI+w1EVgKHjHXA/3hT1vcIvRjvuqq9qzXAz2J09TQS658ugWX
         TCKYM4D9+SHAh/xQQXlmKEv2NwEvuIpdVFTqFX343BezoHWVkTDd68FrrGJvZzVh6i7P
         k0sg==
X-Gm-Message-State: AJIora8tVaFZGoU81E5ZQd5mVobnSRrA9sBuuINenWrS9fn5emgmP2TP
        edmJnm7CAeQ023nygrte8/JB1MTTgmRZxLR4TA8=
X-Google-Smtp-Source: AGRyM1s8Uc00XbGXmfBqcFMckxxCmi4IWvyOr3ucunfbRWdYVZlLl2PNQoJuWPow7udoUHd+a9F0Wn05n+xiL+FYTck=
X-Received: by 2002:a05:622a:490:b0:31d:2a47:c221 with SMTP id
 p16-20020a05622a049000b0031d2a47c221mr8350459qtx.212.1657394086000; Sat, 09
 Jul 2022 12:14:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6214:1d2f:0:0:0:0 with HTTP; Sat, 9 Jul 2022 12:14:45
 -0700 (PDT)
Reply-To: stanleydenford100@gmail.com
From:   Stanley Denford <sanjosarees@gmail.com>
Date:   Sat, 9 Jul 2022 12:14:45 -0700
Message-ID: <CAMXaW2gae6RAtp72J5LXGYzLEfkMuOjz02J257wSZbQ6xT4MmQ@mail.gmail.com>
Subject: Good day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

-- 
Good day, How are you doing today

I am Stanley Denford, a Client Relations officer. I got your name and
contact information in my quest for her existing extended family, I am
writing to you on highly confidential grounds with mutual benefit in
respect to the estate of Frances...

The estate is worth millions of Dollars.I'd appreciate it if you get back
to me by confirming to me if this medium is safe and confidential enough to
enable me divulge to you details on why I contacted you.

Regards,
Stanley Denford
