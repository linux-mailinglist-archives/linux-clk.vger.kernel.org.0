Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B89482774
	for <lists+linux-clk@lfdr.de>; Sat,  1 Jan 2022 13:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbiAAMFn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 1 Jan 2022 07:05:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbiAAMFl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Jan 2022 07:05:41 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1411C061746
        for <linux-clk@vger.kernel.org>; Sat,  1 Jan 2022 04:05:41 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id r16-20020a17090a0ad000b001b276aa3aabso19740576pje.0
        for <linux-clk@vger.kernel.org>; Sat, 01 Jan 2022 04:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=pWxBGFN4ApgqJwf1g75yjalz71/Vkjy4C+I7YyE/QBxkjYv0gtUlAkafbBoWZA9GGM
         EKaSHcxJEfohDUHtiX965mZ9QqbVvyeRFCJ9vhQC1U+8lgaLRu4XtVNDTlUAbF+aSmnN
         Z745p17LI9Dg9USUAiH/AXsR4fCIRWxOOoNXOUF6mgiC6m3esjWLWbxpNIFyz6g3ESEJ
         p4vYEzpdcwqmedK99MvRJGu+u99bj2Ll7LTHdrvNzzuhYOL/DLZW+cSZvErw6zHagsN8
         Od7yFtqTh8uuod00IHmlJhT6zMyuIZdUFOsprElYtELdYvI03fl/i4Ad8xRktl51whgi
         hgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=OKp/Pob8ODVJ2/Lgdm+2xOajHzPxsIjS4KCSBKtP5CoI5MlHDx68Nh3XdL9A4xCorz
         WgjTsGVva6cSVVzy1OTeb4ccqQtkA9yuLqXPFUTbQehX0mjf0u/PXbTo1tKpoeEZ858y
         FaVd5ctMcLEw8JXyka3JycHhMQPVvuGkkCT4GYdICfsJOrmSFvStXSo/2pELLH95WSkL
         193NA4hk6PnGhZZyKrbl0Q4MSUzpjM+5xyzMTYQWmlxNnm3IN9ud1oJO1nJHfXvFXDl8
         DhHZzpwJ1/dvhgVwDG0oAwy93BfazLA10Yp25OiMty+mFVNw1lHYGCH8XFGYZSUJgl95
         8zyA==
X-Gm-Message-State: AOAM531tI1kcJi/eUPaUFLpZ27CuBBiImhCL6d9atEGvRy2eWtYQKvAY
        nMVEbHALjqfwx8jA6P9ghl0=
X-Google-Smtp-Source: ABdhPJwSDu3Ib/vJLIgIp74qikqQWNBI3b5TiKh9uXfSy22f9olrljyGHssHMUxhfAAdiYvjS7HozQ==
X-Received: by 2002:a17:902:6847:b0:149:8367:19d4 with SMTP id f7-20020a170902684700b00149836719d4mr25673420pln.31.1641038741370;
        Sat, 01 Jan 2022 04:05:41 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id a21sm32528954pfg.204.2022.01.01.04.05.32
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 04:05:40 -0800 (PST)
Message-ID: <61d04394.1c69fb81.a0875.98f0@mx.google.com>
From:   yalaiibrahim818@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 14:05:22 +0200
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

