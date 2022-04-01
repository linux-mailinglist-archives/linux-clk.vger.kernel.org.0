Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DADE4EF7AF
	for <lists+linux-clk@lfdr.de>; Fri,  1 Apr 2022 18:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344919AbiDAQVY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 1 Apr 2022 12:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353172AbiDAQSc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Apr 2022 12:18:32 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7151EC61E
        for <linux-clk@vger.kernel.org>; Fri,  1 Apr 2022 08:43:38 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id h16so1969418wmd.0
        for <linux-clk@vger.kernel.org>; Fri, 01 Apr 2022 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=a/s/cQUC8KpuGk5obwWTvvpjBMJcid3ZuNPjNqrspII=;
        b=CVowp9Pt5NyRXSVgcgJytPLu9LlXkAqyrfRMHZHhO4MowqTPRLKifXJgtgs1aoNaFd
         ZhKTmEgY4gvUGYkZ5lu3Bz9fDF1d1qsOfuKDDDxzNMRc9YX/1LMOJsHeu80DyThUxHLw
         Ox6xeR5m8r+KjUKzgL0GATTfp6ywrcIvE0g2BJ2PZYmp3RszJfLwXOr6l71kkXslOz+d
         dO3vIu+tkX5L34+QA8RkCd0c2AlAT1qcezKMrFo+iRZIIIotb7p7aqCreEZsoJbKLtgb
         L4+i3LpXJ1O9HsHa3QonLtAVwnVa902/LmpbUWcZcw4Tw8CIoHTliIRRhjaH8mnfdWDj
         INPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=a/s/cQUC8KpuGk5obwWTvvpjBMJcid3ZuNPjNqrspII=;
        b=v/465x6AU89KsA6q3rnbdnHrKgmOyIQHZVPx737Vrev6oBYoR3AOevevt1ATKS9W5d
         KhM2YuXpHDIpC4AUy+4/1Hf47jwaWi9D2NvZNJTDDz3OBcKd8fvJRk6I+Mm7+lqg22oU
         AB/+TUt8OTKVQyfF/aj7mm0YIDZTvZu0xRdSC4iT5h7f/1SWtOFxPUQIWr9+zhfkRi28
         3TFQ6meAtzpA9T6V8kyBynUBSpdUAvDBW55gbCD07+8+6BnTwM/wnWnuZWDHAv0ZrtZl
         MX4Cy1bXRPiuKnKib/Jqv9CgGJvN2nzfdVjhHFkyieGhzYn1WzD9rV5QvM2gbYUwDR7q
         hSqw==
X-Gm-Message-State: AOAM531olc9AXLxaWYSjZsNTKGAs9Vmfn0M9x6sR7F5bGQOQshBD+KPi
        I4npnYDcUNgv2ty2FzS9r7hIGtlo0uDxUzOqBOg=
X-Google-Smtp-Source: ABdhPJxMHJYkCr/zwOR7ESGlwoRAFQR53hEbUoeVWVRpFOv99m6fKOu1iuSZWnGoJlZVJVL8EdxjM6l6XCuySpvxC0c=
X-Received: by 2002:a1c:ed18:0:b0:37e:7a1d:a507 with SMTP id
 l24-20020a1ced18000000b0037e7a1da507mr9310911wmh.187.1648827817149; Fri, 01
 Apr 2022 08:43:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:600c:4f08:0:0:0:0 with HTTP; Fri, 1 Apr 2022 08:43:36
 -0700 (PDT)
Reply-To: tuulii@adres.pl
From:   Ahmed Kimtinga <amedkim@gmail.com>
Date:   Fri, 1 Apr 2022 04:43:36 -1100
Message-ID: <CA+O2pgdttsO28ogx3t=jxJm_w=VNTfq7tYAawFhd98wQH9i4YA@mail.gmail.com>
Subject: For You !
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.0 required=5.0 tests=ADVANCE_FEE_2_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:329 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [amedkim[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  2.0 ADVANCE_FEE_2_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As-salamu alaykum,

Longest time my dear, I know you might have deleted my mail; I=E2=80=99m th=
e
banker that contacted you for inheritance claim of US$4.3million long
ago abandoned by our deceased costumer from Syria.

I 'm happy to inform you that the transaction has ended well through
the help of Mr JAK ABDULLAH FRAAM MISHALL, from Syria having his
investment in Poland.

I 'm waiting for my bank to approve my resigning letter as I will soon
be on my way to Poland with my family to investment and reside there.

It's true I was surprised of your silent, but while sharing the fund
with Mr Jak,I reminded him that i contacted you first for the
business, so we agreed to give you US$ 1million for keepping the
secret, Mr JAK, took 1.3Milion, I, 2milion US$.

Mr Jak, had an emergency that obligate him to fly back to Poland
yesterday leaving a permitting document to the bank instructing them
to pay the remaining  $US 1million to you, a copy of this document is
here with me.

Whatsapp +226 60 69 50 43

Urgently waiting .

Best Regard
Ahmed Kimtinga.
Accountant IB-Bank Staff BF.
Burkina Faso.
