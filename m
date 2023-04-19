Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E796E77F9
	for <lists+linux-clk@lfdr.de>; Wed, 19 Apr 2023 13:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbjDSLDd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 19 Apr 2023 07:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjDSLDb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Apr 2023 07:03:31 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388D946B4
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 04:03:30 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-54f6a796bd0so380215167b3.12
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681902209; x=1684494209;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AZtZFW4Yu8/s9hisFwTitWaI2cjRerxPZcc9cSg2rPE=;
        b=jfUC/JrMl5HBoSD8vzvfnPIPKcL9zGugtYiYjLVIoE5hCxJz5aERW2NkEn1mrG+oJV
         AJ2cGlzuHwMZsQhzB+PumeC6fHkSGGG4EP3XExXEW2xC1unTIiYxBhGyy1cGSImyKfSh
         0l40U69pxec1llfmtFKtBoKY11ChWJfZcLPVdYsE5HtWoAr5q3SnTgOEWjry7WO2zBcj
         pcyI1UIehQjC/j1PXgoJufhFSmVnCQqK0Qn2Cposas3kN2nw+GtFMy9itoYN2sOpP5r3
         RElcCXWnS+cnLpbBsNiodvYeTEcE1W6L6i31Kfg8L1/tMCaXHLCaGedWQxYr9XvsTHhL
         PY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902209; x=1684494209;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZtZFW4Yu8/s9hisFwTitWaI2cjRerxPZcc9cSg2rPE=;
        b=GfmmbitpId+D8Tm+LpPiNf0RHBFslbD7PNDUERxw+6lGVTg+OLb0unBQ86ZGciXeK5
         6TuOT0JXcALl0AcHRrGeWg9iO+6/+tCMX+xjyZBaEyKY3fzV9YNx2jRqa3XQKznHVqDW
         Kq0WTrBr+qSN79h04SQx3TMyNUWg2u/Ci0Mp9qY5c7ZJlSFyM5uoQ19fCot0q/MhSXep
         drNEJI2PRUMmR0Og2pRDzx+EomhOnhFwTThy+9prwS594cCp97sj4jn/M8zyBbwEYSbs
         86SkxD8+DHMJHJl6TGEGj4X4OxkPuTmZ1R7wGwZ+FdkHHHq9OJdga/CraWJzNrsS5ecM
         9Z1w==
X-Gm-Message-State: AAQBX9cMZ7jFIjAnfGoODqoLQpJVa3GFT7U6Uu9dTeWpLI9nxEwXUFwI
        79yuCavgHU+cVMA2GGeH9Np811hVPemWuj4j/xs=
X-Google-Smtp-Source: AKy350a1axSdqNbQE9/Wu3QBoJySvv+BHKuWixkV5Rj8uRt+NptGgvr5ZT7S2wqRwAdFH74QuTidxnO9I3xDtKYErbA=
X-Received: by 2002:a81:643:0:b0:54f:85bc:a808 with SMTP id
 64-20020a810643000000b0054f85bca808mr1852708ywg.16.1681902208520; Wed, 19 Apr
 2023 04:03:28 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mis.vera145@gmail.com
Sender: adamsfrancis140@gmail.com
Received: by 2002:a05:7010:218c:b0:344:4f01:f1f with HTTP; Wed, 19 Apr 2023
 04:03:27 -0700 (PDT)
From:   Vera Wilfred <mis.vera145@gmail.com>
Date:   Wed, 19 Apr 2023 12:03:27 +0100
X-Google-Sender-Auth: VhMy34hnjLDOgImwuuurqZ3v79s
Message-ID: <CAD3yhOUetLWku9w1EXAcbSk4HoudPHpM+3sQXos9+-Kx9TEmzg@mail.gmail.com>
Subject: Ich bin Mis Vera Wilfred
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--=20
Hallo,

Ich bin Mis Vera Wilfred aus Abidjan Cote D'Ivoire (Elfenbeink=C3=BCste)
Ich bin 22 Jahre alt, M=C3=A4dchen, Waise, das hei=C3=9Ft, weil ich keine E=
ltern
habe, ich habe ungef=C3=A4hr (10.500.000,00 US-Dollar) Zehn Millionen,
f=C3=BCnfhunderttausend vereint Staatsdollar.

Was ich von meinem verstorbenen Vater geerbt habe, hat er den Fonds
auf einem Fest- / Wechselkonto bei einer der besten Banken hier in
Abidjan hinterlegt.

mein Vater hat meinen Namen als seine einzige Tochter und einziges
Kind f=C3=BCr die n=C3=A4chsten Angeh=C3=B6rigen des Fonds verwendet.

Zweitens bekunden Sie mit Ihrer vollen Zustimmung, mit mir zu diesem
Zweck zusammenzuarbeiten, Ihr Interesse, indem Sie mir antworten,
damit ich Ihnen die notwendigen Informationen und die Details zum
weiteren Vorgehen zukommen lassen kann. Ich werde Ihnen 20% des Geldes
anbieten deine Hilfe f=C3=BCr mich.

M=C3=B6ge Gott Sie f=C3=BCr Ihre schnelle Aufmerksamkeit segnen. Meine best=
en
und liebensw=C3=BCrdigen Gr=C3=BC=C3=9Fe an Sie und Ihre ganze Familie, wen=
n Sie mich
f=C3=BCr weitere Details kontaktieren.

Ich brauche Ihre Assistentin, um mir zu helfen, diesen Fonds in Ihrem
Land zu investieren. Kontaktieren Sie mich jetzt f=C3=BCr weitere Details.
Vielen Dank

Vera Wilfred.
