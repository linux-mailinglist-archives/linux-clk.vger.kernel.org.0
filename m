Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F27C3784E58
	for <lists+linux-clk@lfdr.de>; Wed, 23 Aug 2023 03:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbjHWBn1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 22 Aug 2023 21:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232075AbjHWBn0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 21:43:26 -0400
X-Greylist: delayed 918 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:43:24 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA9C10D
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 18:43:24 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-4e-64e54bbc3faa
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 0B.FB.10987.CBB45E46; Wed, 23 Aug 2023 04:58:52 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=QGH9go68Bnbm83SaA+AH7yZCqeCioQNhkplho/Zvu8LkpWJCcY3NmoKnrRnHQLm5H
          bgK01MPJBcZSIcxJd53P1Cyr5Q9tDZyg7LB8t7HZwtTZI4eBM8iRWGruiwiDeKbyB
          OXrzhXaLCANJFSS3EVDxEOvRNS4ji/dpGugIkhJ3E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=hIyJABRPTFhvRaykEs0Ff0CILy6S0WrpHthS3uJeJQypcXYA3sGRMAUZT3E02OMPL
          hAOO1yBwPrWnGNhHrenH4AIBcQye3Z9YHvSIzOcrb7w5YTijMlS+WqgTw4JXj2/DR
          zNfBhuneeG0JP+Hr2RFfz//Cb8ZiOxJJ59uEoffNY=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:30:59 +0500
Message-ID: <0B.FB.10987.CBB45E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-clk@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:13 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVyyUKGW3eP99MUg6l/NS0+9txjdWD0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OSQEDCRWPvyF2sXIxeHkMAe
        JomdFyeygSRYBFYzSzxoSgNJsAg8ZJY4enczVFUzo0TPnjVAVRwcvALWEt/25oM0MAvoSdyY
        OgWsmVdAUOLkzCcsEHFtiWULXzODlDMLqEl87SoBCQsLiEl8mraMHcQWEZCVuHXsJ1grm4C+
        xIqvzYwQN6hKXLm+FmyMkICUxMYr69kmMPLPQrJtFpJts5Bsm4WwbQEjyypGieLK3ERgoCWb
        6CXn5xYnlhTr5aWW6BVkb2IEBuHpGk25HYxLLyUeYhTgYFTi4f257kmKEGtiGVDXIUYJDmYl
        EV7p7w9ThHhTEiurUovy44tKc1KLDzFKc7AoifPaCj1LFhJITyxJzU5NLUgtgskycXBKNTDu
        9z/Jqm3nJPLm7Edvw/W79y6y1el8V/SMOerJFi+fA6s+/udkPJw0pXhvjel+g7oXj1JXBcte
        +XFFhs8yYMHOJXMDQzawvpZ00zv33WFBx6Zcy7O77D2+7VPs32jRJKC9wHeet93n0+fWrHvi
        15MQdDUoSGNKiRxTAuMjBdniVwcc57w8+XauEktxRqKhFnNRcSIAJBb3Tz4CAAA=
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

