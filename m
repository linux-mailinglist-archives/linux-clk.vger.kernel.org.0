Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0619C482736
	for <lists+linux-clk@lfdr.de>; Sat,  1 Jan 2022 11:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbiAAK3T (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 1 Jan 2022 05:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiAAK3S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Jan 2022 05:29:18 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962C2C061574
        for <linux-clk@vger.kernel.org>; Sat,  1 Jan 2022 02:29:18 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id c9-20020a17090a1d0900b001b2b54bd6c5so11138005pjd.1
        for <linux-clk@vger.kernel.org>; Sat, 01 Jan 2022 02:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=qloV/hRhRMPg9TZjdpxPNsSBQM9wKKYz4UUeLPuWp27ASMF2d9mszDybe5h+f1sdLm
         39Ml3G7o3klJAc7nBqW+WY40857veQ9odSksI9R+QJwCk/GVSzybjOybhlflPX7nRvHv
         W8YYIY9akK5kFXknl9oBncr6DaXNC4qMqiR5Z5YUUimSCljGa2LMOG1HtpglrKbTAf1/
         cg9m7Pp1+qBk0Q/eNqkBTDOfoBRilTD8LqZX23bA/qxBRSGQruRHGRiFFAnman5tdfpU
         FAs51jCdx9yhatvNBweelzssHZ1M5y/z2lUrqSmbcPMzx9t9OmCcBrcYPFic0i9X4Etd
         57ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=6L2Th3E6eVlHlF/FyeJHps0n3pPwCUxomBAhvSajaumn9Sf3ziUD50GINQfyDKTWRO
         qbCfvaGcKFFa/NAqHzJCqxzjJtU7+WNsifH+DG4EOd50SNUGiKM2DrEt4B433yS0BsU3
         h9yTOtncLbS/LJv3e8p+UcBJLp/TER/5ultNg0fceSzdy2Q1+s3ZPJY/1XhjJGIZgopN
         jCqVAgMI16//cRw0aNRD+StCmA0ZJUCR/hr9PW5ZzMNPhmP4ZoQiPb7rlnhjMmwmsUy8
         WJmpDbNCaYdXUv8yNV675SOzMIjWfFC3q2Mrq1eY0mWYbsB95JxnZirKoIb4vFKIFZGZ
         n2hQ==
X-Gm-Message-State: AOAM531QG7ELapat75Ez+MSfHmgcfKN2swda+xnl6luFhaOqgEpp1T07
        qI+kXPL9KTeREaMMO5/5WKQ=
X-Google-Smtp-Source: ABdhPJzxqGfP3IJnlh6jbysl6ONaGNkUrWbLlFREtZNXud0L7txO6b+l96riW22DRYEygPw/BOjUHw==
X-Received: by 2002:a17:902:7294:b0:149:64f4:bdba with SMTP id d20-20020a170902729400b0014964f4bdbamr34050515pll.48.1641032958163;
        Sat, 01 Jan 2022 02:29:18 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id e9sm27443407pgp.39.2022.01.01.02.29.10
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 02:29:17 -0800 (PST)
Message-ID: <61d02cfd.1c69fb81.ff6c2.deac@mx.google.com>
From:   vipiolpeace@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 12:29:02 +0200
Reply-To: andres.stemmet1@gmail.com
X-Mailer: TurboMailer 2
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I want to confide in you to finalize this transaction of mutual benefits. I=
t may seem strange to you, but it is real. This is a transaction that has n=
o risk at all, due process shall be followed and it shall be carried out un=
der the ambit of the financial laws. Being the Chief Financial Officer, BP =
Plc. I want to trust and put in your care Eighteen Million British Pounds S=
terling, The funds were acquired from an over-invoiced payment from a past =
contract executed in one of my departments. I can't successfully achieve th=
is transaction without presenting you as foreign contractor who will provid=
e a bank account to receive the funds.

Documentation for the claim of the funds will be legally processed and docu=
mented, so I will need your full cooperation on this matter for our mutual =
benefits. We will discuss details if you are interested to work with me to =
secure this funds. I will appreciate your prompt response in every bit of o=
ur communication. Stay Blessed and Stay Safe.

Best Regards


Tel: +44 7537 185910
Andres  Stemmet
Email: andres.stemmet1@gmail.com  =

Chief financial officer
BP Petroleum p.l.c.

                                                                           =
                        Copyright =A9 1996-2021

