Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72AEC4E9FD2
	for <lists+linux-clk@lfdr.de>; Mon, 28 Mar 2022 21:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238233AbiC1TgQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Mar 2022 15:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbiC1TgQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Mar 2022 15:36:16 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89708BF45
        for <linux-clk@vger.kernel.org>; Mon, 28 Mar 2022 12:34:35 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id e4so16729776oif.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Mar 2022 12:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=tJWmq9G1Gr+aa1y6az6AlHp+P9/CCOfAfKqWCIJvSkw=;
        b=bx5zclZVnd8wYEjQ9JDBdMfFi+42XZTOlyqYusXUsVzwkIOJY04qDRR2cZByJf5Q2m
         3hImSEg0+eWsBbD+aifMPuC041VU94UZ7klnYqM65pcdVQ7g9aGWq+zoZ+vLMm2glOOU
         WK8flbuTk609svE53eWxahBdVA9Yq0cPybWIqQJS83mFf5/MYay2SHsOJBjGUzUVUtpl
         APMDzSfqVR+K3S/AnOMXkg8KSRWbwK7+sjfRhYFD9563TRNUclYL22h5yNUKFFcjAk4T
         T7Ek5trvr5cLhBj5MxPf1Ie3y8yq1YbCmuk9MLXiojJpieqPYtytJC0+/TIBA93MW7Fo
         2N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=tJWmq9G1Gr+aa1y6az6AlHp+P9/CCOfAfKqWCIJvSkw=;
        b=bTbRa8Nu5w8MdzHgFjmTIFu82tZkbad33OV3b6x5QCOkXBCrg5XWF4x/OfKcBUjcco
         O7RftOuwOoCV53C5/pxRbJZ65ZSGwcSIK1h5HhlqAYnFDvUSB9nzCfwNYqIQb4MJ0OHh
         U0Sj1KI9AZOd5Um9EdwxKmqPrNiVu/TZP0O2NwnPkUA/d75+uW1jS8Ce4zQ3ITf0xdOW
         0LI4DynA+gI9ncnlkK2fke7o9sw5dn3fFKDJaBtcnTBcEPSu9pRIjVZNAVsP4wSxDqep
         3NNxZAo0b/3qPAcv4kJA7G5Njpd2UzcgrUoqDAKMJnVe00hQ8xKcOHOxDO13oB8+Kmfi
         Q3MA==
X-Gm-Message-State: AOAM533KAKUi1M37oWH1cqCA3I8+gRMHplmwcK/k+keaE2iLsG+2USL1
        yrMjgd5KIWVdii8G9NiOxfwN6D16lXNIIZzekwg=
X-Google-Smtp-Source: ABdhPJzou0G9b7TVxa+A/+HDr6/oAZABtcZOqMPDNumT88oAxzf7D3nGHJOF+ZAjG8t9nhyB5oqdBwsY/+3fqMW3AGE=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr386207oic.200.1648496074983; Mon, 28
 Mar 2022 12:34:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6838:f1c5:0:0:0:0 with HTTP; Mon, 28 Mar 2022 12:34:34
 -0700 (PDT)
Reply-To: pm2956161@gmail.com
From:   philip moore <contact.donkalidon@gmail.com>
Date:   Mon, 28 Mar 2022 12:34:34 -0700
Message-ID: <CAGXj=C4tQwQc55uE9dkaGdWdPvqRMyoQtYi=K+07Wp2PV3xThQ@mail.gmail.com>
Subject: Urgent
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_40,DKIM_SIGNED,
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

Greetings,


Hope you are fine .


Please did you got my previous email to you ?


With Respect
Mr philip moore
