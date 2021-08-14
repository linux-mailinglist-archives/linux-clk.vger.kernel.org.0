Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3243EC54A
	for <lists+linux-clk@lfdr.de>; Sat, 14 Aug 2021 23:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbhHNVDc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 14 Aug 2021 17:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbhHNVDb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Aug 2021 17:03:31 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C87C061764
        for <linux-clk@vger.kernel.org>; Sat, 14 Aug 2021 14:03:02 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso12095736wmq.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Aug 2021 14:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=5NTJSky9UX3JbuB9riY3wCYfXDpCwy2c7hzO0kF4AHA=;
        b=SjoGxzSneAs4MWLY6KG3R+2o5NA6h51uJV60s/HEUhTuKfduF+v5ylJBvADm5/tKrj
         xo+fbhaYfoGohHX/m9LUAEuY1isVkNGuGuGpnb9N8nI0tLwSUQMerfcpZpjBRRoFAhI0
         Xe1C4h7yqBugOyPfagRGYPGDAUy5QEo4IXio91zRNFltSd92f41KwdzC3QJkRR/yeEnw
         VYAxbPf9O5C1Fta0NZjo32cY3MTUemt30aIC9AvQSI/ZwH00Jd44e85uSBA+OFAQjEV8
         KzIenlCFySu4u6TG7E0IW+C7QkNUAJEZ4sacRbCWPxhKXqhXNiiy85UOcdQ/ryIq7+Xy
         trWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=5NTJSky9UX3JbuB9riY3wCYfXDpCwy2c7hzO0kF4AHA=;
        b=Muz3RMGomWP/Om4DxBgW6CeO6d+QVh2Kzk4TChy7kfbV0gPkyqxnCz9kbJG0Ie60sW
         SE/CIwih90uW+9bsHcsL2rYwMkhJm2igNM6DCznvaDUyVv+rl5RzwMnpZz20VnpGonid
         AkK2oObOwgElAVSpN5ewPyPjcVAUIADtcOBMpxPZ9Vpdwu6ugQ6oRJIvBOnIHRCwTFVn
         9IyVfygT2Lt8oz+1Z2ol4t7CmodF/caTVwkMdbAvJvKmNMhB/oo1o4qiPr64jwlJDJqs
         aexx0F9PR2ltJc5U6unPi+i7kGrMxr8WhNeJrT50Y5VGtczwinJIYNKAGkqQjCjH4h0i
         TP5g==
X-Gm-Message-State: AOAM533xWtQGXvopwAB4AZRHylq09uUFWeYWj0VhJfUdubXyI52duu6t
        PV2ZqBAZwPXOubFNP2hG5yY=
X-Google-Smtp-Source: ABdhPJzeQ6o1oC+55xUlEIciDyv9BKJP9sSS6cY8d3EWxnxswpLv22i4SyI0/kPFnLQ0+JeDExmXow==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr8285882wmc.35.1628974980765;
        Sat, 14 Aug 2021 14:03:00 -0700 (PDT)
Received: from [192.168.1.70] ([102.64.221.122])
        by smtp.gmail.com with ESMTPSA id y192sm4734525wmy.1.2021.08.14.14.02.54
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Aug 2021 14:03:00 -0700 (PDT)
Message-ID: <61182f84.1c69fb81.eb9ef.9544@mx.google.com>
From:   Vanina curth <curtisvani0029@gmail.com>
X-Google-Original-From: Vanina curth
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Sir,
To:     Recipients <Vanina@vger.kernel.org>
Date:   Sat, 14 Aug 2021 21:02:43 +0000
Reply-To: curtisvani9008@gmail.com
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

How are you? I'm Vanina. I'm interested to know you and I would like to kno=
w more about you and establish relationship with you. i will wait for your =
response. thank you.
