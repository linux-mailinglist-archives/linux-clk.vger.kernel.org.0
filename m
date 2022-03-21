Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5924E34A3
	for <lists+linux-clk@lfdr.de>; Tue, 22 Mar 2022 00:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbiCUXuU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Mar 2022 19:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbiCUXuP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 19:50:15 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182BE18FADD
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 16:48:32 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a26so9129094lfg.10
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 16:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=vZTvMBdW3SQjqfTPOqJ6W0r31NdUorzCOEH8bkHbTlQ=;
        b=DNJxsbg9hyEho72sbA/PsOzXerpDKUbAoD1Wltv+qjynA4sLHEDGiZnBca4lu2VCdc
         0qYWrPEtVItPwhew2p3BfdYIwdLfkzWI0G+/98zuPY5/F077QHyD7hO/ravHqjwRsK3U
         yBB1Db5KF8G538bbhK4CN/5Ua6eTOFqlAi5nIqopXR0dF3W58UhtYB5VwtTPBReeESwV
         PLAu6mYjKAv8MMVI9UM5GYe2oz/RM4CdOIEZoXx2FTVQUioN+VPz2N4nH7XCk/Jw3ZHK
         F+6u2Tp7tOe44sime6Pnrjma/bJ7dFshJeaic/595Lt8K3GSGQwNI06zEVOztMXcI2wR
         NJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=vZTvMBdW3SQjqfTPOqJ6W0r31NdUorzCOEH8bkHbTlQ=;
        b=WnT0khO5aK7lonj6E6asBIr6MdXoLPjy64xxNcXdCFvZWzH7hV80q4KNdPnqjZEQ6v
         WxHW12fj9gwKTvAJXLfpQaT/QRV7buchZYNIsNQHtj6yEYNi9gWNetDv6ZO9PAjS7Zt8
         UfshO/9ijhLOCkCG21Siynt84csV7IRWbkoXjoZQbdClw3szASueT09KVoqgxI1+IYyb
         TUp8lBGR6ZFUBexnIZ5uUfZhfXBQfVu2qf+EpPKdbkqu4I6nPMbl/JfByZGJjW394sxr
         Dq4cCl8xNVdqruzKMFeZ9io0J/HaxEnGsMZzw5CD+G7B8IZfKvajB0g8vFRtt3nHaljb
         UFYw==
X-Gm-Message-State: AOAM533eZvnjGGUAKANobC5Tb2ELvPWhXGAWv02Rzscj1FLiv9NewAdF
        RtmtTchZbSu6htKWuZpfakR0+VkUQ0mbdRG6YQI=
X-Google-Smtp-Source: ABdhPJx7rQTHgMyRQeVsjHOMLgiPFC3LjYOg+7kRD+GTWefIdhqs8NVdrUwKtdOwPwwbe8EbEZErNggB18ZQ1LY4hbs=
X-Received: by 2002:a05:6512:104d:b0:44a:360e:ebe1 with SMTP id
 c13-20020a056512104d00b0044a360eebe1mr1975152lfb.655.1647906505442; Mon, 21
 Mar 2022 16:48:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:da4a:0:b0:1a5:bbcd:69f6 with HTTP; Mon, 21 Mar 2022
 16:48:24 -0700 (PDT)
Reply-To: tuulii@adres.pl
From:   "Dr.Ibrahim" <tassingt@gmail.com>
Date:   Mon, 21 Mar 2022 12:48:24 -1100
Message-ID: <CAGRDgB_8h6nKg=F5WUPUdiErPvD5bsNix9p4ky3Tc8ayGgvDfQ@mail.gmail.com>
Subject: Do You Remember ?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.4 required=5.0 tests=ADVANCE_FEE_2_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5878]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tassingt[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  2.0 ADVANCE_FEE_2_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Salamo Alaykom,

Longest time my dear, I know you might have deleted my mail; I=E2=80=99m th=
e
banker that contacted you for inheritance claim of US$4.3million long
ago abandoned by our deceased costumer from Syria.

I 'm happy to inform you that the transaction has ended well through
the help of Mr Kent Travolter from Poland.

I 'm waiting for my bank to approve my resigning letter as I will soon
be on my way to Poland with my family to investment and reside there.

It's true I was surprised of your silent, but while sharing the fund
with Mr Travolter,I reminded him that i contacted you first for the
business before him, so we agree to give you US$ 1million for keepping
the secret, Mr Travolter took 1.3Milion and I as the inventor took
2milion US$.

Mr Travolter my partner doesn=E2=80=99t want to return to the bank again, h=
e
instructed the bank to packaged your US$ 1million in a small box to
deliver to you through Cargo as family treasure, he is now waiting for
your address =E2=80=A6=E2=80=A6........and phone=E2=80=A6=E2=80=A6.to send =
this packaged to you as
he's ready to return to Poland.

Whatsapp +226 60 69 50 43

Urgently waiting .

Best Regard
Dr Ibrahim .K. Ahmed.
Accountant IB-Bank Staff BF.
Burkina Faso.
