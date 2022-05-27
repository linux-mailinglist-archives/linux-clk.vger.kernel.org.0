Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C1A5367E8
	for <lists+linux-clk@lfdr.de>; Fri, 27 May 2022 22:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236211AbiE0UJg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 May 2022 16:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbiE0UJf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 May 2022 16:09:35 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382E86B7CF
        for <linux-clk@vger.kernel.org>; Fri, 27 May 2022 13:09:35 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id t2so5641747qkb.12
        for <linux-clk@vger.kernel.org>; Fri, 27 May 2022 13:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=LRyR7rrQ4EQutP4jVNVJcIGkxL13aXkrq4evTC9LzsM=;
        b=V2S7ecdiS2QcJq6L5MXTU0pfE/bL/rtsxrH9jw2wvsvKchR8HkXzSPTbA1lHSGCIUO
         9sDzBbH0g3rkCpsO12xUJU1DGhm/sVJ3GVpIEvI8VMpGcA6Pa8STxtAgZG50YtCi11Rp
         2CBS6d2wbqLYnsCGOcx0RSbZ2mkoQ2TMAvhhlVCLosAxs9mcBgSfnfoU3wejsS1lVSgL
         mILIUSAnvcH6kNYyHASsotZ+vvW4nq/HrBlKAnI37AGchGVs8qwlwbYMxoVn7UfhZhsc
         gevg6kUGuEFcjfgpSfPzUkisL+BM/9BbY29PuKrRA5hOhujs1oZhSxd2N5/x8i+uq3Ac
         X/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=LRyR7rrQ4EQutP4jVNVJcIGkxL13aXkrq4evTC9LzsM=;
        b=RBOCoO4GxBwxHOPTFezx15OnrFbBGl+TqEQ6UcCSRuqFWPtycR3wA1Tw97zeIgMOYo
         jD1mp4l/xoQC/Gi2gfc5Hwpu4410D7vwZb5yzp7t7Pgqbz+4IxKgaiWHjs49jvL/WP2o
         N6P+QATYvSFVwAAxWJoBRJPMfGkpOIMa29zbnyB5ysuCjyMp1ZRjIrzfOWkRHHAzQvls
         UZgayJIJ32tTCIsuolPUsj7hUXVfIRlxgg2jiXQW0mKDJcJJ5mkXjOiNbsvcDNLQ0PDk
         2YpFasAJLU+OfFsIapDF8cv8mzWVOHD0yHi+Ax2gUVq6uGaauIHkYBU7JnKqaQaPK/BX
         Yz+g==
X-Gm-Message-State: AOAM532EjbXbOvhaeNzkIBdEdhhgyNl8/HEACJ6b1bTxArX9isPsM527
        xOAE48gMrytxSvdr/uDrPwPb4c4fNn8G4kyUZbE=
X-Google-Smtp-Source: ABdhPJzTZhl4vh4UpnbVZ5s/fSf03lhmvAmWdaLYNQSWGFXRrnTb7gSmw1gri6SOh/myHHjRRT6kcg4CCK0oXWvN3jQ=
X-Received: by 2002:a05:620a:4495:b0:6a3:77be:9ccd with SMTP id
 x21-20020a05620a449500b006a377be9ccdmr19624558qkp.452.1653682174005; Fri, 27
 May 2022 13:09:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6200:5e9e:b0:42e:5df4:72be with HTTP; Fri, 27 May 2022
 13:09:33 -0700 (PDT)
Reply-To: filelotcon@gmail.com
From:   Alex Kupiec <hassangilbert105@gmail.com>
Date:   Fri, 27 May 2022 21:09:33 +0100
Message-ID: <CAADjkSeQo5imbesfkwPxoypeH9bgRe4ybHZNeWXgPp7SMDtocg@mail.gmail.com>
Subject: PLEASE READ!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.6 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,HK_SCAM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:742 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7171]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [hassangilbert105[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hassangilbert105[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.3 HK_SCAM No description available.
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sir/Ma,

My Name is Alex, resident in South Africa and the United Kingdom. I
own an International Outsourcing Agency. I recommend credible
Entrepreneur/Fund Managers to Silent Investors that are looking for
Fund Managers/Entrepreneur to invest and manage funds on a long term.

I have an offer from my client to recommend on merit a reputable
Private Individual/ Company Owner with good financial standing to
receive and invest the sum of US$2 billion in a secure High Risk/Low
Risk Investment that will generate a good Return on Investment
annually {ROI}.

The Investment Capital shall be managed for a period between 15 years
from the date of receipt of Investment Capital. In addition, your
compensation and benefits will be communicated to you in my next email
if you are ready, willing and able to accept this Business Proposition
as stated herein.

Kindly indicate your interest and drop your Private Telephone Numbers
for discussion of this offer in more details should you find my offer
interesting. The Investment Capital will be disclosed if interested.

I look forward to hearing from you shortly.

Yours Truly,
Alex Kupiec.
