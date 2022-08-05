Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B4658A981
	for <lists+linux-clk@lfdr.de>; Fri,  5 Aug 2022 12:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240325AbiHEKcj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 5 Aug 2022 06:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237773AbiHEKcj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Aug 2022 06:32:39 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1501F61B
        for <linux-clk@vger.kernel.org>; Fri,  5 Aug 2022 03:32:37 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id m4so4288655ejr.3
        for <linux-clk@vger.kernel.org>; Fri, 05 Aug 2022 03:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=m/lWmigg7QWQP/ZalIs7bTVcjXCKoXMfSKIZCuq1ZwY=;
        b=O+KpfhTdSUHM/GPjmzgYDq4cyuOwYAe0GBV/mSgiadc3cCDCJOgDquVKdHxJ71nbBQ
         ztv/uqKtEbWCm8mvLeZ7xONULuQoynkWnkoGvvllsRcyyB1Vl/+psvEM8Y5PNCzVHkIZ
         OhJoEwVngFNw86R2iG4GYnX2TMnpibdUGh4uWQAiW3L/r+dIrq+A6y8JSV+1QaOzqLFL
         q9CzoLYHkMWB8YLUE8JuIThMxK0IT3tN3BkF2MeNWWyDAIt8faiBSyi2G4Rr36m98iEP
         8PVFOpZSPlM3lVrVfiE+nNvndoN0urgjmM/uTizA1KFmXrsJbS2ZICtGKNwlGSqiIyLJ
         n1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=m/lWmigg7QWQP/ZalIs7bTVcjXCKoXMfSKIZCuq1ZwY=;
        b=F2LoFDD81jpiG9yp5eiq/s6XN+G0fyLO2Imcvh6AP3krtkbWSUggrxu4VoVrwLlJxW
         DECXvPkTQr7nvfzSAlvJLcAm/A5T7GpsKmzmHJrNQZ7P/edRSmURGlijeVwIRfZ5XfLg
         WOObjTxYO4Y0rvvefcn/uKpoAzq7pqK+gXluWK3uU07xL/POq/9eB8ANZY5/1/mQmjOR
         VSyB6+yO8RSI1vD58IZHTFlvHJ5z2ILcCEg8o+VsQNlmcKxVYq9cod7mMctm5kp/189u
         px8T4ghRGS+fNljsCRU/xdzZU5ST/l4KVyx8j5WgINeMNVCBJ0qhOF4zqJTvENOxpOC7
         uKVQ==
X-Gm-Message-State: ACgBeo1WjGdi2GpzUxrtWLalK+2kua7//Ymm7dg0qG5f6mR797doSNy0
        GwsRTEsLJPQWu2kTpP94B1PwEEZxbwDZeiX/4mo=
X-Google-Smtp-Source: AA6agR70YaxAV1TUFW6Pb7ySFnpg5JmpmiKwz0GC5xNMzf/lIYNcuOvAmycdGiOYYqyVRSrg2LC++DszMfWDpX8Mpj4=
X-Received: by 2002:a17:907:97cb:b0:731:6d1:13fa with SMTP id
 js11-20020a17090797cb00b0073106d113famr743852ejc.375.1659695555557; Fri, 05
 Aug 2022 03:32:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:e8a:0:0:0:0 with HTTP; Fri, 5 Aug 2022 03:32:34
 -0700 (PDT)
Reply-To: sarahritterhouse60@gmail.com
From:   Sarah Ritterhouse <deborahdonatus60@gmail.com>
Date:   Fri, 5 Aug 2022 03:32:34 -0700
Message-ID: <CADwFS4PJzizT8VpVz1G7+4Xky3DmueCkkbKWO3PZmSBWtJWSEQ@mail.gmail.com>
Subject: please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.0 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:632 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6889]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [deborahdonatus60[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [deborahdonatus60[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sarahritterhouse60[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I am interested
